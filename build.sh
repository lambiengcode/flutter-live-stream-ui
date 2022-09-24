echo "1. APK"
echo "2. AppBundle"
echo "3. flutter build ios - release"
echo "4. flutter build apk - dev"
echo "5. flutter build ios - dev"
while :
do 
	read -p "Build to: " input
	case $input in
		1)
		flutter build apk --target-platform android-arm,android-arm64 --dart-define="lambiengcode=PRODUCTION" --release -v
		break
		;;
		2)
		flutter build appbundle --target-platform android-arm,android-arm64 --dart-define="lambiengcode=PRODUCTION" --release -v
		break
		;;
		3)
		flutter build ios --dart-define="lambiengcode=PRODUCTION" --release -v
		break
		;;
		4)
		flutter build apk --target-platform android-arm,android-arm64 --dart-define="lambiengcode=DEV" --release -v
		break
		;;
		5)
		flutter build ios --dart-define="lambiengcode=DEV" --release -v
		break
		;;
		*)
		;;
	esac
done
echo "Build successfully!"