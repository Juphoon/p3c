#!/bin/sh
#
# author:       Harvey Li
# last updated: 2021/04/27
#
# This is the script to install juphoon's p3c-pmd to ${HOME}/juphoon/dev_tools/ along with git's pre-commit script

target_path="${HOME}/juphoon/dev_tools"
jar="juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar"

if [ ! -d ${target_path} ]
then
    mkdir -p ${target_path}
fi

if [ ! -e ${jar} ]
then
    echo "p3c-pmd jar file is not found! Please download the installer from github.com/juphoon/p3c release section"
    exit 1
fi

cp juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar ${target_path}/.
