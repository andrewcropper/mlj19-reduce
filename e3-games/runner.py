import os
import sys
import signal
# import common
import string
import subprocess
import numpy as np
import math
import time
from scipy import stats
from os import listdir
from os.path import isfile, join
sys.path.append('../')
from common import call_prolog
from common import parmap

metarules = ['g-d-012-s','g-d-012-e','g-d-012-d','g-d-012-dm']
learning_timeout = 600

def game_names():
    return [
        'gt_attrition',
        'gt_centipede',
        'gt_chicken',
        'gt_prisoner',
        'minimal_decay',
        'minimal_even',
        'multiplebuttonsandlights',
        'scissors_paper_stone',
        'untwisty_corridor'
    ]

# def game_names():
#     return [
#         'minimal_decay'
#     ]


def data_path(stage,game):
    path='exp/{}/{}/'.format(stage,game)
    mkdir(path)
    return path

def train_data_path(game):
    return data_path('train',game)

def test_data_path(game):
    return data_path('test',game)

def program_path(mrules,game):
    path='programs/{}/{}/'.format(mrules,game)
    mkdir(path)
    return path

def results_path(mrules,game):
    path='results/{}/{}/'.format(mrules,game)
    mkdir(path)
    return path

def mkdir(path):
    if not os.path.exists(path):
        os.makedirs(path)

def pred(atom):
    xs=atom.split('(')
    return (xs[0],xs[1].count(',')+1)

def targets(inpath):
    return set(f.split('.')[0] for f in listdir(inpath) if isfile(join(inpath, f)))

def gen_atom(index,x):
    syms = ['succ','input','between','true','number','index']
    x=x.replace(' ','')[:-1]
    (p,args)=x.split('(')
    args=list(filter(lambda x: x!='',args.split(',')))
    args=[str(index)]+args
    for sym in syms:
        if sym in p:
            p=p.replace(sym,'my_{}'.format(sym))
            break
    return '{}({})'.format(p,','.join(args))


def pred(atom):
    xs=atom.split('(')
    return (xs[0],xs[1].count(',')+1)

def filter_by_targ(targ,xs):
    return filter(lambda x: x.startswith(targ[0]),xs)

def parse_test(outpath,target,bk,pos,neg):
    (p,a)=target
    fname=outpath + '{}.pl'.format(p)
    with open(fname,'w') as f:
        for atom in bk:
            f.write('{}.\n'.format(atom))
        for atom in pos:
            f.write('pos({}).\n'.format(atom))
        for atom in neg:
            f.write('neg({}).\n'.format(atom))
    subprocess.call(['sort',fname,'-o',fname])

def parse_target(datafile):
    with open(datafile,'r') as f:
        episode=0
        atoms = set()
        bk,statics,pos,neg=[],[],[],[]

        for x in f.read().split('---'):
            xs=list(map(lambda x: x.strip(), x.strip().split('\n')))
            h,t=xs[0],xs[1:]
            if h == 'atoms:':
                atoms.update(set(t))
            elif h == 'statics:':
                statics.extend(t)
            elif h == 'background:':
                episode+=1
                bk.extend([gen_atom(episode,atom) for atom in t + statics])
            elif h == 'positives:':
                e_pos=set(t)
                pos.extend([gen_atom(episode,atom) for atom in e_pos])
                neg.extend([gen_atom(episode,atom) for atom in atoms if atom not in e_pos])

        for targ in set(map(pred,pos+neg)):
            yield (targ,bk,filter_by_targ(targ,pos),filter_by_targ(targ,neg))

def do_train(inpath,outfile,target,mrules):
    trainf=inpath+target
    mrule_path='../mrules/{}.pl'.format(mrules)
    swipl(action='learn,halt.',load_files=['experiment',trainf,mrule_path],outfile=outfile,timeout=learning_timeout)

def swipl(action,load_files,outfile=None,timeout=None):
    call('swipl',action,load_files,outfile,timeout)

def yap(action,load_files,outfile=None,timeout=None):
    call('yap',action,load_files,outfile,timeout)

def call(prolog_version,action,load_files,outfile=None,timeout=None):
    load_files = map(lambda x: "'{}'".format(x),load_files)
    cmd = "load_files([{}],[silent(true)]). ".format(','.join(load_files))
    cmd+=action

    # print(cmd)
    if outfile == None:
        p = subprocess.Popen([prolog_version,'-q'], stdin=subprocess.PIPE)
        call_p(p,cmd,timeout)
    else:
        d=None
        print(cmd)
        with open(outfile, 'w') as outf:
            p = subprocess.Popen([prolog_version,'-q','-G8g'], stdin=subprocess.PIPE, stdout=outf)
            a=time.time()
            call_p(p,cmd,timeout)
            b=time.time()
            d=str(b-a)
        if d != None:
            with open(outfile, 'a') as outf:
                outf.write('%time,' + d)

def call_p(p,cmd,timeout):

    try:
        print(cmd)
        p.stdin.write(cmd.encode())
        p.communicate(timeout=timeout)
    except Exception as e:
        print(e)
    finally:
        p.kill()


def parse_(args):
    (stage,game,target)=args
    outpath=data_path(stage,game)
    datafile='data/{0}/{1}_{2}_{0}.dat'.format(stage,game,target)
    for (subtarget,bk,pos,neg) in common.parse_target(datafile):
        prims=set(map(common.pred,bk))
        (p,a)=subtarget
        fname=outpath + '{}.pl'.format(p)
        with open(fname,'w') as f:
            for atom in bk:
                f.write('{}.\n'.format(atom))
            for atom in pos:
                f.write('pos({}).\n'.format(atom))
            for atom in neg:
                f.write('neg({}).\n'.format(atom))
            for (p,a) in prims:
                # add negation
                f.write('not_{0}({1}) :- \+ {0}({1}).\n'.format(p,','.join(string.ascii_uppercase[:a])))
                f.write('prim({}/{}).\n'.format(p,a))
                f.write('prim(not_{}/{}).\n'.format(p,a))
        subprocess.call(['sort',fname,'-o',fname])

def parse():
    jobs=[]
    for stage in ['train','test']:
        for game in game_names():
            for target in ['next','goal','legal','terminal']:
                jobs.append((stage,game,target))
    parmap(parse_,jobs)

def train_(args):
    (mrules,game,target) = args
    inpath=train_data_path(game)
    outpath=program_path(mrules,game)
    do_train(inpath,outpath+'{}.pl'.format(target),target,mrules)

def train():
    jobs=[]
    for mrules in metarules:
        for game in game_names():
            inpath=train_data_path(game)
            outpath=program_path(mrules,game)
            for target in targets(inpath):
                jobs += [(mrules,game,target)]
    parmap(train_,jobs)

def do_test_(args):
    (mrules,game)=args
    inpath=test_data_path(game)
    outpath=results_path(mrules,game)
    for target in targets(inpath):
        dataf=inpath + "{}.pl".format(target)
        programf=program_path(mrules,game) + '{}.pl'.format(target)
        outf=outpath+'{}.pl'.format(target)
        # yap('do_test,halt.',['experiment',dataf,programf],outf,timeout=None)
        swipl('do_test,halt.',['experiment',dataf,programf],outf,timeout=None)

def do_test():
    list(parmap(do_test_,list((mrules,game) for mrules in metarules for game in game_names())))

# results is a list of (predication,label) pairs
# seems a bit cumbersome
def balanced_acc(results):
    tp,tn,num_p,num_n=0.0,0.0,0.0,0.0

    for prediction,label in results:
        if label == 1:
            num_p+=1
        if label == 0:
            num_n +=1
        if prediction == 1 and label == 1:
            tp+=1
        if prediction == 0 and label == 0:
            tn+=1

    if num_p == 0 and num_n == 0:
        return -1
    elif num_p > 0 and num_n > 0:
        return ((tp / num_p) + (tn / num_n))/2
    elif num_p == 0:
        return (tn / num_n)
    elif num_n == 0:
        return (tp / num_p)

def res_parser(resultsf):
    with open(resultsf) as f:
        for line in f:
            if line.startswith('%time'):
                continue
            xs=line.strip().split(',')
            if len(xs)>1:
                yield (int(xs[0]),int(xs[1]))

def times_parser(resultsf):
    with open(resultsf) as f:
        for line in f:
            if line.startswith('%time'):
                xs=line.strip().split(',')
                return float(xs[1])

def print_results():
    mscores={}
    for mrules in metarules:
        mscores[mrules]=[]
        all_scores=[]
        for game in game_names():
            inpath='exp/test/{}/'.format(game)
            for target in ['next','goal','legal','terminal']:
                target_scores=[]
                sub_targets=targets(inpath)
                for sub_target in sub_targets:
                    if sub_target.startswith(target):
                        resultsf=results_path(mrules,game)+'{}.pl'.format(sub_target)
                        xs=list(res_parser(resultsf))
                        target_scores+=xs
                        mscores[mrules]+=xs
                all_scores += [balanced_acc(target_scores)]
                #print(target,balanced_acc(target_scores))
        print(mrules,int(np.mean(all_scores)*100))


    # k1='g-d-012-d'
    # k2='g-d-012-dm'
    # alld=mscores[k1]
    # alld2=mscores[k2]
    # alld=[1 if x==y else 0 for (x,y) in alld]
    # alld2=[1 if x==y else 0 for (x,y) in alld2]
    # b = sum(1.0 for (x,y) in zip(alld,alld2) if x == 1 and y == 0)
    # c = sum(1.0 for (x,y) in zip(alld,alld2) if x == 0 and y == 1)
    # McN = math.pow((b-c),2) / (b+c)
    # print(f'P-value: {1-stats.chi2.cdf(McN,1):.3f}')


def print_times():
    mscores = {}
    for mrules in metarules:
        all_scores=[]
        mscores[mrules]=all_scores
        for game in game_names():
            inpath='exp/test/{}/'.format(game)
            for target in ['next','goal','legal','terminal']:
                target_scores=[]
                sub_targets=targets(inpath)
                for sub_target in sub_targets:
                    if sub_target.startswith(target):
                        resultsf=program_path(mrules,game)+'{}.pl'.format(sub_target)
                        ltime=times_parser(resultsf)
                        all_scores+=[ltime]
        print(mrules,int(np.mean(all_scores)))
    # x='g-d-012-e'
    # y='g-d-012-d'
    # res=stats.ttest_rel(mscores[x],mscores[y])
    # print(f'P-value: {res.pvalue:.3f}')

arg = sys.argv[1]

if arg == 'learn':
    learn()
if arg == 'test':
    test()
if arg == 'results':
    print_results()
    print_times()