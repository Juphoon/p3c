#!/bin/sh
#
# author:       Harvey Li
# last updated: 2021/04/27
#
# This is the script to install juphoon's p3c-pmd to ${HOME}/juphoon/dev_tools/ along with git's pre-commit script

target_path="${HOME}/juphoon/dev_tools"
jar="juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar"

if type -p java; then
    echo "检测到 Java Executable."
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo "检测到 Java Executable, JAVA_HOME=$JAVA_HOME"
    _java="$JAVA_HOME/bin/java"
else
    echo "未检测到 Java Executable, 请确保安装了Java SRE."
    exit 1
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo "检测到版本 $version ..."
    if [[ "$version" < "1.7" ]]; then
        echo "版本太低，请将JAVA版本升级到1.7+"
        exit 1
    fi
fi

if [ ! -d ${target_path} ]
then
    mkdir -p ${target_path}
fi

if [ ! -e ${jar} ]
then
    echo "p3c-pmd jar file 未找到! 请下载installer ==> github.com/juphoon/p3c release section."
    exit 1
fi

cp juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar ${target_path}/.
