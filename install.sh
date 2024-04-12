#!/bin/bash
# Exectute > chmod +x ./install.sh && ./install.sh
clear
sudo test

layout="$PWD/install"
source "$layout/variables.sh"

chmod +x "$layout/script-init.sh"
source "$layout/script-init.sh"

echo "Menu :"
echo "-------------------------------"
echo
echo -e "\e[31m\e[1m[c]\e[0m - Create build (default)"
echo -e "\e[31m\e[1m[r]\e[0m - Recreate containers (compose up)"
echo -e "\e[31m\e[1m[d]\e[0m - Recreate containers (compose up) with delete and recreate database"
echo -e "\e[31m\e[1m[i]\e[0m - New install (delete all images and recreate build)"
echo -e "\e[31m\e[1m[b]\e[0m - Rebuild (delete old images and recreate build)"
echo -e "\e[31m\e[1m[q]\e[0m - Quitter"
read -n 1 -rp " > " val
line -t ""
#
if [[ "${val^^}" == "Q" ]]; then
    clear
    exit 1
fi
pause s 1 m

if [[ ${val^^} == "I" ]]; then
    echo "Nouvelle Installation :"
    echo "----------"

elif [[ ${val^^} == "R" ]]; then
    echo "Recreate containers (compose up) :"
    echo "----------"

elif [[ ${val^^} == "D" ]]; then
    echo "Recreate containers (compose up) with recreate db:"
    echo "----------"

elif [[ ${val^^} == "B" ]]; then
    echo "Rebuild :"
    echo "----------"
else
    echo "Create Build :"
    echo "-------------"
fi

if [ -d "$folder_rel_data" ]; then
    case "$val" in
    [Rr] | [Bb] | [Cc])
        # Suppression de la base de donnée
        echo
        echo "Voulez-vous supprimer la base de donnée ? "
        read -n 1 -rp $'\e[31m\e[1m[Y]\e[0mes / \e[31m\e[1m[N]\e[0mo (is default) -- \e[31m\e[1m[Q]\e[0muitter> ' val_bd
        line
        line -t ""

        if [[ "${val^^}" == "Q" ]]; then
            clear
            exit 1
        fi

        case "$val_bd" in
        [Yy] | [Yy][Ee][Ss])
            sudo rm -rf $folder_rel_data
            ;;
        esac
        ;;
    esac
fi
case "$val" in
[Rr] | [Bb] | [Cc])
    source $layout/default.sh
    ;;
esac

if [[ ${val^^} == "I" ]]; then
    source "$layout/installation.sh"

elif [[ ${val^^} == "R" ]]; then
    source "$layout/composeup.sh"

elif [[ ${val^^} == "D" ]]; then
    source "$layout/newsdb.sh"

elif [[ ${val^^} == "B" ]]; then
    source "$layout/rebuild.sh"

else
    source "$layout/buildnews.sh"

fi
pause s 1 m

if [ -d "$folder_rel_data" ]; then
    sudo chown -R $user $folder_rel_data
fi

echo -e "'\e[1m Nettoyage des images\e[0m'"
echo "-----------------------------"
my_array=("backend_$name" "<none>" "app-php")
pause s 1 m

# Boucle pour lire le tableau
for element in "${my_array[@]}"; do
    docker rmi $(docker images | grep "$element" | awk '{print $3}')
done

docker volume prune --force
echo "** Images nettoyées **"
echo

docker-desktop

echo
echo "---------------------------------"
echo "Veux tu ouvrir le site ? "
echo -e "\e[31m\e[1m[y]\e[0mes / \e[31m\e[1m[n]\e[0mo > "
read -n 1 -rp " > " val
line -t ""
if [[ "${val^^}" == "Y" ]]; then
    URL "https://localhost:443"
fi
echo
echo -e ' Lien pour ouvrir symfony (CTRL + clic): '
echo -e "\e[1m\e[34mhttps://localhost:443\e[0m"
echo
