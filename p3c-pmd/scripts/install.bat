:: This is the script to install juphoon's p3c-pmd to ${HOME}/juphoon/dev_tools/ along with git's pre-commit script
@echo off
    setlocal enableextensions disabledelayedexpansion

    set target_path="c:\juphoon"
    set jar="juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar"
    setlocal ENABLEEXTENSIONS DISABLEDELAYEDEXPANSION

    :: for variables
    ::    %%L = possible locations under HKLM\SOFTWARE of JavaSoft registry data
    ::          note: the list includes native and redirected locations
    ::    %%J = possible locations under %%L where to find the JRE information
    ::          note: the list is sorted from newer to older locations
    ::    %%k = The generated JRE root key to check
    ::    %%v = current java version
    ::    %%e = path to java

    for %%L in (
        "" "Wow6432Node\"
    ) do for %%J in (
        "JRE" "Java Runtime Environment"
    ) do if not defined javaDir (
        for %%k in (
            "HKLM\SOFTWARE\%%~LJavaSoft\%%~J"
        ) do for /f "tokens=3" %%v in (
            'reg query "%%~k" /v "CurrentVersion" 2^>nul ^| find /i "CurrentVersion"'
        ) do for /f "tokens=2,*" %%d in (
            'reg query "%%~k\%%v" /v "JavaHome"   2^>nul ^| find /i "JavaHome"'
        ) do ( set "javaDir=%%~e" & set "javaVersion=%%v" )
    )

    if not defined javaDir (
        echo 未检测到JAVA，请确保JAVA已经安装
    ) else (
        echo JAVA_HOME="%javaDir%"
        echo JAVA_VERSION="%javaVersion%"
        if "%javaVersion%" LSS "1.7" (
            ECHO 版本太低，请将JAVA版本升级到1.7+
            pause
        )
    )

    if not exist "%target_path%\*" (
        md %target_path%
    )

    if not exist "%jar%\*" (
        ECHO p3c-pmd jar file 未找到! 请下载installer ==> github.com/juphoon/p3c release section.
        pause
    )

    COPY juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar %target_path%

    pause
