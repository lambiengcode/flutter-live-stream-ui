echo "1. import_sorter"
echo "2. dart_code_metrics"
echo "3. injectable"

while :
do 
	read -p "Run with: " input
	case $input in
		1)
		flutter pub run import_sorter:main
		break
		;;
		2)
		flutter pub run dart_code_metrics:metrics analyze lib
		break
        ;;
		3)
		flutter packages pub run build_runner build 
		break
        ;;
        *)
		;;
	esac
done