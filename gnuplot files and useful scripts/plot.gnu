reset
set terminal pngcairo
set title "Cummulative Regret vs Horizon"
set xlabel "Horizon"
set ylabel "Regret"
set key right top

set for [i=1:5] xtics (10**i)
set logscale x 10

set output "./graphs/cummulative_2_0.05.png"
plot    "./results/cummulative_output_2_0.05_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_2_0.05_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.05_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_2_0.1.png"
plot    "./results/cummulative_output_2_0.1_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_2_0.1_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.1_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_2_0.18.png"
plot    "./results/cummulative_output_2_0.18_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_2_0.18_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_2_0.18_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_5_0.05.png"
plot    "./results/cummulative_output_5_0.05_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_5_0.05_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.05_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_5_0.1.png"
plot    "./results/cummulative_output_5_0.1_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_5_0.1_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.1_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_5_0.18.png"
plot    "./results/cummulative_output_5_0.18_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_5_0.18_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_5_0.18_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_10_0.05.png"
plot    "./results/cummulative_output_10_0.05_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_10_0.05_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.05_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_10_0.1.png"
plot    "./results/cummulative_output_10_0.1_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_10_0.1_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.1_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_10_0.18.png"
plot    "./results/cummulative_output_10_0.18_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_10_0.18_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_10_0.18_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_25_0.05.png"
plot    "./results/cummulative_output_25_0.05_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_25_0.05_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_25_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_25_0.05_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints

set output "./graphs/cummulative_25_0.1.png"
plot    "./results/cummulative_output_25_0.1_UCB" using (10**($0+1)):1 title 'UCB' with linespoints, \
		"./results/cummulative_output_25_0.1_BETA-UCB" using (10**($0+1)):1 title 'BETA-UCB' with linespoints, \
		"./results/cummulative_output_25_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title 'ADAPTIVE-BETA-UCB' with linespoints, \
		"./results/cummulative_output_25_0.1_UCB-TUNED" using (10**($0+1)):1 title 'UCB-TUNED' with linespoints
