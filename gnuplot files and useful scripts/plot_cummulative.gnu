reset
set terminal pngcairo
set title "Cummulative Regret vs Horizon"
set xlabel "Horizon"
set ylabel "Regret"
set key right top

set for [i=1:5] xtics (10**i)
set logscale x 10

set output "./graphs/cummulative_UCB_2.png"
plot    "./results/cummulative_output_2_0.05_UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_2_0.1_UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_2_0.18_UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_BETA-UCB_2.png"
plot    "./results/cummulative_output_2_0.05_BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_2_0.1_BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_2_0.18_BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_ADAPTIVE-BETA-UCB_2.png"
plot    "./results/cummulative_output_2_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_2_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_2_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB-TUNED_2.png"
plot    "./results/cummulative_output_2_0.05_UCB-TUNED" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_2_0.1_UCB-TUNED" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_2_0.18_UCB-TUNED" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB_5.png"
plot    "./results/cummulative_output_5_0.05_UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_5_0.1_UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_5_0.18_UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_BETA-UCB_5.png"
plot    "./results/cummulative_output_5_0.05_BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_5_0.1_BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_5_0.18_BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_ADAPTIVE-BETA-UCB_5.png"
plot    "./results/cummulative_output_5_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_5_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_5_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB-TUNED_5.png"
plot    "./results/cummulative_output_5_0.05_UCB-TUNED" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_5_0.1_UCB-TUNED" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_5_0.18_UCB-TUNED" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB_10.png"
plot    "./results/cummulative_output_10_0.05_UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_10_0.1_UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_10_0.18_UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_BETA-UCB_10.png"
plot    "./results/cummulative_output_10_0.05_BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_10_0.1_BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_10_0.18_BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_ADAPTIVE-BETA-UCB_10.png"
plot    "./results/cummulative_output_10_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_10_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_10_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB-TUNED_10.png"
plot    "./results/cummulative_output_10_0.05_UCB-TUNED" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_10_0.1_UCB-TUNED" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_10_0.18_UCB-TUNED" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB_25.png"
plot    "./results/cummulative_output_25_0.05_UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_25_0.1_UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_25_0.18_UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_BETA-UCB_25.png"
plot    "./results/cummulative_output_25_0.05_BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_25_0.1_BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_25_0.18_BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_ADAPTIVE-BETA-UCB_25.png"
plot    "./results/cummulative_output_25_0.05_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_25_0.1_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_25_0.18_ADAPTIVE-BETA-UCB" using (10**($0+1)):1 title '0.18' with linespoints

set output "./graphs/cummulative_UCB-TUNED_25.png"
plot    "./results/cummulative_output_25_0.05_UCB-TUNED" using (10**($0+1)):1 title '0.05' with linespoints, \
		"./results/cummulative_output_25_0.1_UCB-TUNED" using (10**($0+1)):1 title '0.1' with linespoints, \
		"./results/cummulative_output_25_0.18_UCB-TUNED" using (10**($0+1)):1 title '0.18' with linespoints
