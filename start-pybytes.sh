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

read -r -p "Start mqtt-server? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t mqtt-server -G "cd mqttserver; npm run devbabel"
fi

read -r -p "Start PyBill? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t PyBill -G "cd pybill; npm run devbabel"
fi

read -r -p "Start PyAuth? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t PyAuth -G "cd pyauth; npm run devbabel"
fi

read -r -p "Start Pybytes-api? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t Pybytes-api -G "cd pybytes-api; npm run devbabel"
fi

read -r -p "Start Pybytes-react? [Y/n] " response
if [[ ${response} =~ ^(yes|Y|y| ) ]] || [ -z ${response} ]; then
    ttab -t Pybytes-react -G "cd pybytes-react; npm run start"
fi
