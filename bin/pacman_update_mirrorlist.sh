read -p "Are you sure you want to update the Archlinux mirrorlists?  (y/n): " choice

if [[ $choice != "y" && $choice != "Y" ]]; then
    echo "Exiting..."
    exit 1
fi

echo "This will take some time. Do not interrupt the script."

sudo pacman -S reflector 
sudo reflector  --latest 50 --protocol https --sort rate --save /etc/pacman.d/mirrorlist 
sudo pacman -Rns reflector 
