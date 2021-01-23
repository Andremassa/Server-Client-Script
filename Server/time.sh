{
    for ((i = 0 ; i <= 125 ; i+=1)); do
        read -p "" -t 0.05
        echo $i
    done
} | whiptail --gauge "Wasting your time!" 6 60 0

{
    for ((i = 0 ; i <= 125 ; i+=1)); do
        read -p "" -t 0.05
        echo $i
    done
} | whiptail --gauge "Wasting more of your time!" 6 60 0

if (whiptail --title "OK OK WE'RE DONE HERE!!!" --yesno "











YES        TO              ExiT" --no-button "NOP" --yes-button "nop" 20 30) then
    echo ""
else
    echo ""
fi

{
    for ((i = 0 ; i <= 100 ; i+=50)); do
        sleep 3
        echo $i
    done
} | whiptail --gauge "Let's stay a while longer!" 6 60 0

echo ""

exit
