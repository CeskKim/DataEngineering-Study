import time
#################################################################
# 일반 상황
#################################################################
def gerneral_do_some_work(x):
    time.sleep(1)
    return x

start = time.time()
results = [gerneral_do_some_work(x) for x in range(4)]
print("duration = ", time.time() - start)
print("result = ", results)

#################################################################
# Ray구문
#################################################################
import ray

ray.init(num_cpus = 4) # Specify this system has 4 CPUs.

@ray.remote
def do_some_work(x):
    time.sleep(1) # Replace this is with work you need to do.
    return x

start = time.time()
results = [do_some_work.remote(x) for x in range(4)]
print("duration = ", time.time() - start)
print("result = ", results)