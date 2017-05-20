interval=5
outFile="status.csv"

while true; do

	pingOutput=$(ping -c 1 www.bing.com)

	ip=$(echo $pingOutput | awk -F "[()]" '/from/{print $2}')
	
	timestamp=$(date +%F\ %T)

	if [ "$ip" = '192.168.1.1' ]; then
		output="$timestamp,0"
	else
		output="$timestamp,1"
	fi
	
	echo $output
	echo $output >> $outFile

	sleep $interval

done

