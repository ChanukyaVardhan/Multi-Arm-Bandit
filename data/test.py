import sys
import random

# num_bandits = [2, 5, 10, 25, 50]
num_bandits = [25]

# std_dev_range_start = [0.01, 0.05, 0.1, 0.18, 0.28]
# std_dev_range_end = [0.03, 0.08, 0.13, 0.22, 0.3]
std_dev_range_start = [0.18]
std_dev_range_end = [0.22]

for N in range(len(num_bandits)):

	mean = [(i + 1) * 1.0 / (num_bandits[N] + 1) for i in range(num_bandits[N])]
	k = [(1 / mean[i]) - 1 for i in range(num_bandits[N])] # beta = k * alpha

	# for S in range(5):
	for S in range(1):

		sys.stdout = open("N" + str(num_bandits[N]) + "_Dev" + str(std_dev_range_start[S]) + ".txt", "w")

		for i in range(num_bandits[N]):	
			std_dev = random.uniform(std_dev_range_start[S], std_dev_range_end[S])
			alpha = (k[i] - (std_dev * (1 + k[i])) ** 2) / ((std_dev ** 2) * ((1 + k[i]) ** 3))
			print alpha
			print k[i] * alpha
