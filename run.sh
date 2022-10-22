echo "0. Unit Test"
echo "1. Debug with: environment is DEV"
echo "2. Debug with: environment is STAGING"
echo "3. Debug with: environment is PRODUCTION"
echo "4. Release with: environment is DEV"
echo "5. Release with: environment is STAGING"
echo "6. Release with: environment is PRODUCTION"
echo "7. Analyze"
while :
do 
	read -p "Run with: " input
	case $input in
		0)
		flutter test -r expanded
		break
		;;
		1)
		flutter run --dart-define="lambiengcode=DEV"
		break
		;;
		2)
		flutter run --dart-define="lambiengcode=STAGING"
		break
		;;
        3)
		flutter run --dart-define="lambiengcode=PRODUCTION"
		break
		;;
        4)
		flutter run --dart-define="lambiengcode=DEV" --release
		break
		;;
        5)
		flutter run --dart-define="lambiengcode=STAGING" --release
		break
		;;
        6)
		flutter run --dart-define="lambiengcode=PRODUCTION" --release
		break
		;;
        7)
		flutter analyze
		break
		;;
		*)
		;;
	esac
done