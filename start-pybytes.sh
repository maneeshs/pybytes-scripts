#!/usr/bin/env bash

# to get this script working, install ttab before
# npm install ttab -g

# suppose you cloned this repository into directory where you have your other pybytes microservices
#
# pybytes-react/
# pybytes-scripts/
# ...

# you have create link of this script to `pybytes microservices` directory
# to link this script stay in `pybytes microservices` directory and run:
# ln -s pybytes-scripts/start-pybytes.sh start-pybytes.sh

cat << "EOF"

    ____                                ____        __          __
   / __ \__  ___________  ____ ___     / __ \__  __/ /_  __  __/ /____  _____
  / /_/ / / / / ___/ __ \/ __ `__ \   / /_/ / / / / __ \/ / / / __/ _ \/ ___/
 / ____/ /_/ / /__/ /_/ / / / / / /  / ____/ /_/ / /_/ / /_/ / /_/  __(__  )
/_/    \__, /\___/\____/_/ /_/ /_/  /_/    \__, /_.___/\__, /\__/\___/____/
      /____/                              /____/      /____/

EOF

read -r -p "Start mongod? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then

    ps cax | grep mongod > /dev/null
    if [ $? -eq 0 ]; then
      killall mongod
    fi

    ttab -t mongod -G mongod
fi

read -r -p "Start redis-server? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then

    ps cax | grep redis-server > /dev/null
    if [ $? -eq 0 ]; then
      redis-cli shutdown
    fi

    ttab -t redis-server -G redis-server
fi

read -r -p "Start mqtt-server? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t mqtt-server -G npm run --prefix mqttserver develop
fi

read -r -p "Start PyBill? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t PyBill -G npm run --prefix pybill develop
fi

read -r -p "Start PyAuth? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t PyAuth -G npm run --prefix pyauth develop
fi

read -r -p "Start Pybytes-api? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t Pybytes-api -G npm run --prefix pybytes-api develop
fi

read -r -p "Start Pybytes-react? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t Pybytes-react -G npm run --prefix pybytes-react develop
fi
