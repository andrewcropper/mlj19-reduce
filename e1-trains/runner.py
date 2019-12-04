import sys
import math
import time
import numpy as np
import scipy.stats as stats
from itertools import product
sys.path.append('../')
from common import call_prolog
from common import parmap

num_trials = 10
num_tasks = 8
trials = list(range(1,num_trials+1))
mrules = ['u-12-s','u-12-e','u-12-d','u-12-dm']
tasks = list(range(1,9))
max_time = 600

jobs = list(product(mrules, tasks, trials))

def get_train_file(task, trial):
    return f'data/train-{task}-{trial}.pl'

def get_test_file(task, trial):
    return f'data/test-{task}-{trial}.pl'

def get_res_file(ms, task, trial):
    return f'results/{ms}/{task}-{trial}.txt'

def get_program_file(ms, task, trial):
    return f'programs/{ms}/{task}-{trial}.pl'

def gen():
    out = call_prolog('main', ['gen-trains'])
    out = '\n'.join(sorted(out.split('\n')[3:]))
    with open('data/trains.pl', 'w') as f:
        f.write(out)
    call_prolog(f'main({num_trials})', ['gen-data'])

def learn_(args):
    (m, task, k) = args
    data_file = get_train_file(task, k )
    mf = f'../mrules/{m}.pl'
    program_file = get_program_file(m, task, k)
    with open(program_file, 'w') as f:
        a = time.time()
        load_files = ['experiment', data_file, mf]
        prog = call_prolog('learn', load_files, max_time)
        b = time.time()
        if prog == '':
            prog = 'f(_):-false.'
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
    list(parmap(test_, jobs))

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
    for task in tasks:
        out = f'T{task}'
        for ms in mrules:
            accs = []
            for trial in trials:
                k_accs = get_accuracies(ms, task, trial)
                accs.append(np.mean(k_accs))
            mu_acc = int(np.mean(accs)*100)
            sem_acc = int(stats.sem(accs)*100)
            all_accs[ms].append(mu_acc)
            out += f' & {mu_acc} $\pm$ {sem_acc}'
        out += '\\\\'
        print(out)
        print('\hline')
    out = ''
    out+='mean'
    for m in mrules:
        mu_acc = int(np.mean(all_accs[m]))
        sem_acc = int(stats.sem(all_accs[m]))
        out += f' & {mu_acc} $\pm$ {sem_acc}'
    print(out)


def time_results():
    all_times = {ms:[] for ms in mrules}
    for task in tasks:
        out = f'T{task}'
        for ms in mrules:
            times = []
            for trial in trials:
                k_times = get_times(ms, task, trial)
                times.append(np.mean(k_times))
            mu = int(np.mean(times))
            sem = int(stats.sem(times))
            all_times[ms].append(mu)
            out += f' & {mu} $\pm$ {sem}'
        out += '\\\\'
        print(out)
        print('\hline')
    out = ''
    out+='mean'
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
    gen()
if arg == 'learn':
    learn()
if arg == 'test':
    test()
if arg == 'results':
    results()