reset
set terminal pngcairo
set title "Regret vs Time"
set xlabel "Time"
set ylabel "Regret"
set key right top

set output "./graphs/2_0.05_10.png"
plot    "<(sed -n '1,10p' ./results/output_2_0.05_10/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.05_10/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.05_10/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.05_10/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.05_100.png"
plot    "<(sed -n '1,100p' ./results/output_2_0.05_100/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.05_100/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.05_100/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.05_100/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.05_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_2_0.05_1000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.05_1000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.05_1000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.05_1000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.05_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_2_0.05_10000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.05_10000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.05_10000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.05_10000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.05_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_2_0.05_100000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.05_100000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.05_100000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.05_100000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.1_10.png"
plot    "<(sed -n '1,10p' ./results/output_2_0.1_10/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.1_10/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.1_10/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.1_10/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.1_100.png"
plot    "<(sed -n '1,100p' ./results/output_2_0.1_100/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.1_100/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.1_100/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.1_100/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.1_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_2_0.1_1000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.1_1000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.1_1000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.1_1000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.1_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_2_0.1_10000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.1_10000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.1_10000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.1_10000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.1_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_2_0.1_100000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.1_100000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.1_100000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.1_100000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.18_10.png"
plot    "<(sed -n '1,10p' ./results/output_2_0.18_10/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.18_10/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.18_10/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10p' ./results/output_2_0.18_10/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.18_100.png"
plot    "<(sed -n '1,100p' ./results/output_2_0.18_100/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.18_100/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.18_100/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100p' ./results/output_2_0.18_100/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.18_1000.png"
plot    "<(sed -n '1,1000p' ./results/output_2_0.18_1000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.18_1000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.18_1000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,1000p' ./results/output_2_0.18_1000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.18_10000.png"
plot    "<(sed -n '1,10000p' ./results/output_2_0.18_10000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.18_10000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.18_10000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,10000p' ./results/output_2_0.18_10000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines

set output "./graphs/2_0.18_100000.png"
plot    "<(sed -n '1,100000p' ./results/output_2_0.18_100000/average/serverlog.UCB_output)" title 'UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.18_100000/average/serverlog.BETA-UCB_output)" title 'BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.18_100000/average/serverlog.ADAPTIVE-BETA-UCB_output)" title 'ADAPTIVE BETA UCB' with lines, \
		"<(sed -n '1,100000p' ./results/output_2_0.18_100000/average/serverlog.UCB-TUNED_output)" title 'UCB TUNED' with lines