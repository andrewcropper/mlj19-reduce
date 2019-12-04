import subprocess
from multiprocessing import Pool

num_cpus = 8

def parmap(func, jobs):
    if num_cpus == 1:
        return map(func, jobs)
    else:
        p = Pool(num_cpus)
        return p.map(func, jobs)

def call_prolog(action, load_files, timeout = 600):
    load_files = map(lambda x: "'{}'".format(x),load_files)
    cmd = "load_files([{}],[silent(true)]). ".format(','.join(load_files))
    cmd += '{},halt.'.format(action)
    p = subprocess.Popen(['swipl','-q'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    try:
        p.stdin.write(cmd.encode())
        output, _err = p.communicate(timeout = timeout)
        return output.decode()
    except subprocess.TimeoutExpired:
        pass
    finally:
        p.kill()
    return ''