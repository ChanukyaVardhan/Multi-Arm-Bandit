reset
set terminal pngcairo
set title "Regret vs Time"
set xlabel "Time"
set ylabel "Regret"
set key right top

set output "./graphs/UCB-TUNED_fixed_2_10.png"
plot    "<(sed -n '1,10p' ./results/output_2_0.05_10/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.1_10/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.18_10/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_2_100.png"
plot    "<(sed -n '1,100p' ./results/output_2_0.05_100/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.1_100/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.18_100/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_2_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_2_0.05_1000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.1_1000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.18_1000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_2_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_2_0.05_10000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.1_10000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.18_10000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_2_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_2_0.05_100000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.1_100000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.18_100000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_5_10.png"
plot    "<(sed -n '1,10p' ./results/output_5_0.05_10/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10p' ./results/output_5_0.1_10/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10p' ./results/output_5_0.18_10/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_5_100.png"
plot    "<(sed -n '1,100p' ./results/output_5_0.05_100/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100p' ./results/output_5_0.1_100/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100p' ./results/output_5_0.18_100/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_5_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_5_0.05_1000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,1000p' ./results/output_5_0.1_1000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,1000p' ./results/output_5_0.18_1000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_5_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_5_0.05_10000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10000p' ./results/output_5_0.1_10000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10000p' ./results/output_5_0.18_10000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_5_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_5_0.05_100000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100000p' ./results/output_5_0.1_100000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100000p' ./results/output_5_0.18_100000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_10_10.png"
plot    "<(sed -n '1,10p' ./results/output_10_0.05_10/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10p' ./results/output_10_0.1_10/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10p' ./results/output_10_0.18_10/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_10_100.png"
plot    "<(sed -n '1,100p' ./results/output_10_0.05_100/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100p' ./results/output_10_0.1_100/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100p' ./results/output_10_0.18_100/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_10_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_10_0.05_1000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,1000p' ./results/output_10_0.1_1000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,1000p' ./results/output_10_0.18_1000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_10_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_10_0.05_10000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10000p' ./results/output_10_0.1_10000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10000p' ./results/output_10_0.18_10000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_10_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_10_0.05_100000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100000p' ./results/output_10_0.1_100000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100000p' ./results/output_10_0.18_100000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_25_10.png"
plot    "<(sed -n '1,10p' ./results/output_25_0.05_10/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10p' ./results/output_25_0.1_10/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10p' ./results/output_25_0.18_10/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_25_100.png"
plot    "<(sed -n '1,100p' ./results/output_25_0.05_100/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100p' ./results/output_25_0.1_100/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100p' ./results/output_25_0.18_100/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_25_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_25_0.05_1000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,1000p' ./results/output_25_0.1_1000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,1000p' ./results/output_25_0.18_1000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_25_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_25_0.05_10000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,10000p' ./results/output_25_0.1_10000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,10000p' ./results/output_25_0.18_10000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines

set output "./graphs/UCB-TUNED_fixed_25_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_25_0.05_100000/average/serverlog.UCB-TUNED_output)" title '0.05' with lines, \
		"<(sed -n '1,100000p' ./results/output_25_0.1_100000/average/serverlog.UCB-TUNED_output)" title '0.1' with lines, \
		"<(sed -n '1,100000p' ./results/output_25_0.18_100000/average/serverlog.UCB-TUNED_output)" title '0.18' with lines
