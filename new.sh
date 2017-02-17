#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
		sudo service redis-server restart
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 telegram
		chmod +x telegram
}
update() {
  git pull
  git submodule update --init --recursive
}
function print_logo() {
	echo -e "\033[38;5;605m"
	echo -e "            _____         _____ _____    _    __  __             "
	echo -e "           |  ___|____  _|_   _| ____|  / \  |  \/  |            "
	echo -e "           | |_ / _ \ \/ / | | |  _|   / _ \ | |\/| |            "
	echo -e "           |  _| (_) >  <  | | | |___ / ___ \| |  | |            "
  echo -e "           |_|  \___/_/\_\ |_| |_____/_/   \_\_|  |_|            \e[36m"
}
function logo_play() {
    declare -A txtlogo
    seconds="0.015"

txtlogo[1]="                    We are FoxTeams.                           "
txtlogo[2]="                    We are Legion.                             "
txtlogo[3]="                    We do not forgive.                         "
txtlogo[4]="                    We do not forget.                          "
txtlogo[5]="                    Expect us.                                 "
txtlogo[6]="                    Follow Team In TeleGram Channel : @FoxTeam."
   echo -e "\033[0;00m"
   echo -e "\e[36m"

    printf "\033[38;5;650m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
}


if [ "$1" = "install" ]; then
  install
elif [ "$1" = "update" ]; then
  update
else
if [ ! -f ./telegram ]; then
    echo "telegram not found"
    echo "Run $0 install"
    exit 1
 fi


 
   echo -e "\033[38;5;130m"
   logo_play
   echo -e "   _____    _        ____  _____ _____  _      "
   echo -e "  |_   _|__| | ___  | __ )| ____|_   _|/ \     "
   echo -e "    | |/ _ \ |/ _ \ |  _ \|  _|   | | / _ \    "
   echo -e "    | |  __/ |  __/ | |_) | |___  | |/ ___ \   "
   echo -e "    |_|\___|_|\___| |____/|_____| |_/_/   \_\  "
   echo -e "\e[36m"

   ./telegram -s ./bot.lua $@
fi
