#!/bin/bash 
# Helper script for LaTeX, aim to have same functionality as GUI.
# Author: Kevin Cyu, kevinbird61@gmail.com, P76064570@mail.ncku.edu.tw
# 
# Usage: 
# ./run.sh {i16 | i18 | compile | clean}
#   - i16:          installation for ubuntu 16.04 LTS.
#   - i18:          installation for ubuntu 18.04 LTS.
#   - compile:      using pdflatex & bibtex to compile your tex file.
#   - clean:        clean all temp files.

function install_16()
{
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
    # 16.04
    echo "deb http://miktex.org/download/ubuntu xenial universe" | sudo tee /etc/apt/sources.list.d/miktex.list
    sudo apt-get update
    sudo apt-get install miktex
}

function install_18()
{
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
    # 18.04
    echo "deb http://miktex.org/download/ubuntu bionic universe" | sudo tee /etc/apt/sources.list.d/miktex.list
    sudo apt-get update
    sudo apt-get install miktex
}

function compile()
{
    # same function as "pdflatex + MakeIndex + Bibtex"
    # run first time (will generate main.aux for next step)
    pdflatex main.tex
    # run bibtex for database
    bibtex main.aux
    # run second time 
    pdflatex main.tex
}

function clean()
{
    rm -rf *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc
}

if [ $# -eq 0 ]; then
    echo "Usage: ./$(basename $0) {i16 | i18 | compile | clean}"
    echo "  ./$(basename $0) i16: installation for ubuntu 16.04 LTS."
    echo "  ./$(basename $0) i18: installation for ubuntu 18.04 LTS."
    echo "  ./$(basename $0) compile: using pdflatex & bibtex to compile your tex file."
    echo "  ./$(basename $0) clean: clean all temp files."
    exit
fi

if [ "$1" == "i16" ]; then
    install_16
    exit
elif [ "$1" == "i18" ]; then
    install_18
    exit
elif [ "$1" == "compile" ]; then
    # FIXME: let user specify the name of "main" file
    $1
    exit
elif [ "$1" == "clean" ]; then
    $1
    exit
fi

$1