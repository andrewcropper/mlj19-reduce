import sys
import math
import time
import random
import numpy as np
import scipy.stats as stats
from itertools import product
sys.path.append('../')
from common import call_prolog
from common import parmap

num_trials = 10
num_tasks = 50
trials = list(range(1,num_trials+1))
mrules = ['u-2-s','u-2-e','u-2-d','u-2-dm']
tasks = list(range(0,num_tasks))
jobs = list(product(mrules,tasks,trials))
max_time = 600

def get_train_file(task, trial):
    return f'data/train/{task}-{trial}.pl'

def get_test_file(task, trial):
    return f'data/test/{task}-{trial}.pl'

def get_res_file(ms, task, trial):
    return f'results/{ms}/{task}-{trial}.txt'

def get_program_file(ms, task, trial):
    return f'programs/{ms}/{task}-{trial}.pl'

def load_probs(nowrites=True):
    dic = {}
    with open('probs.txt', 'r') as f:
        for line in f:
            if line.startswith('# -*- coding: utf-8 -*-'):
                continue
            xs=line.strip().split('=>')
            if len(xs)==1 and len(xs[0])>0:
                try:
                    problem=int(xs[0][1:])
                    if prob_num > 273:
                        return dic
                except:
                    continue
            elif len(xs)>1:
                if problem not in dic:
                    dic[problem] = []
                dic[problem].append(xs)
    return dic

def gen_data_(dic, trial):
    for problem, examples in dic.items():
        if problem not in tasks:
            continue
        # if len(examples) != 10:
            # continue
        random.shuffle(examples)
        train = examples[:5]
        test = examples[5:]
        filename = get_train_file(problem, trial)
        with open(filename, 'w') as f:
            for x in train:
                a = list(x[0].strip())
                b = list(x[1].strip())
                atom = f'pos({a},{b}).'
                f.write(atom + '\n')
        filename = get_test_file(problem, trial)
        with open(filename, 'w') as f:
            for x in test:
                a = list(x[0].strip())
                b = list(x[1].strip())
                atom = f'pos({a},{b}).'
                f.write(atom + '\n')

def gen_data():
    dic = load_probs()
    for trial in trials:
        gen_data_(dic, trial)

def learn_(args):
    (m, task, k) = args
    data_file = get_train_file(task, k)
    data = f'data/{k}.pl'
    mf = f'../mrules/{m}.pl'
    program_file = get_program_file(m, task, k)
    with open(program_file, 'w') as f:
        a = time.time()
        load_files = ['experiment', data_file, mf]
        prog = call_prolog('learn', load_files, max_time)
        b = time.time()
        if prog == '':
            prog = 'f(_,_):-false.'
        f.write(prog + '\n')
        f.write(f'%time,{b-a}')

def learn():
    list(parmap(learn_,jobs))

def test_(args):
    (m, task, k) = args
    data_file = get_test_file(task, k )
    program_file = get_program_file(m, task, k)
    results_file = get_res_file(m, task, k)
    with open(results_file, 'w') as f:
        f.write(call_prolog('do_test', ['experiment', data_file, program_file]))

def test():
    list(parmap(test_,jobs))

def get_times(ms, task, trial):
    filename = get_program_file(ms, task, trial)
    with open(filename) as f:
        for line in f:
            xs = line.strip().split(',')
            if xs[0]!='%time':
              continue
            return float(xs[1])
    return max_time

def get_accuracies(metarules, task, trial):
    results_file = get_res_file(metarules, task, trial)
    accs = []
    with open(results_file, 'r') as f:
        for line in f:
            line = line.strip()
            if line == '1':
                accs.append(1)
            if line == '0':
                accs.append(0)
    return accs

def acc_results():
    all_accs = {ms:[] for ms in mrules}
    for ms in mrules:
        for trial in trials:
            accs = []
            for task in tasks:
                k_accs = get_accuracies(ms, task, trial)
                accs.append(np.mean(k_accs))
            mu_acc = int(np.mean(accs)*100)
            sem_acc = int(stats.sem(accs)*100)
            all_accs[ms].append(mu_acc)
    out = ''
    for m in mrules:
        mu_acc = int(np.mean(all_accs[m]))
        sem_acc = int(stats.sem(all_accs[m]))
        out += f' & {mu_acc} $\pm$ {sem_acc}'
    print(out)


def time_results():
    all_times = {ms:[] for ms in mrules}
    for ms in mrules:
        for trial in trials:
            times = []
            for task in tasks:
                k_times = get_times(ms, task, trial)
                times.append(np.mean(k_times))
            mu = int(np.mean(times))
            sem = int(stats.sem(times))
            all_times[ms].append(mu)

    out = ''
    # out+='mean'
    for m in mrules:
        mu = int(np.mean(all_times[m]))
        sem = int(stats.sem(all_times[m]))
        out += f' & {mu} $\pm$ {sem}'
    print(out)

def results():
    print('accuracies')
    acc_results()
    print('times')
    time_results()

arg = sys.argv[1]

if arg == 'gen':
    gen_data()
if arg == 'learn':
    learn()
if arg == 'test':
    test()
if arg == 'results':
    results()