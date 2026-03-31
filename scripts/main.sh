logGreetings "Welcome to FLUSH !"

logRequest "Choose an action to continue:"

menu_options=("Info" "Exit")

select menu_option in "${menu_options[@]}"; do
    case $menu_option in
        "Info")
            require "/scripts/info.sh"
            ;;
        
        "Exit")
            exit 1
            ;;
        *)
            logError "Invalid option. Try again."
            ;;
    esac
done