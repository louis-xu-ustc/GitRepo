# File Name: git_repo.sh
# Author: Louis Xu
# mail: louis_xu_ustc@163.com
# Created Time: 03/10/16
#!/bin/bash

CMD=$0
ACTION=$1
PARAMS=$2

GITHUB_REPOS="https://github.com/louis-xu-ustc/Backup.git \
              https://github.com/louis-xu-ustc/CppPrimer.git \
              https://github.com/louis-xu-ustc/GitRepo.git \
              https://github.com/louis-xu-ustc/LeetCode.git \
              https://github.com/louis-xu-ustc/MotionDetection.git \
             "

TOP_DIR=`pwd`

git_clone()
{
    for item in $GITHUB_REPOS; do
        echo ">>>git clone $item"
        git clone $item
        case "$?" in
            0) echo "success.";;
            *) echo "failed.";;
        esac
    done
}

git_pull()
{
    for item in $GITHUB_REPOS; do
        name=`echo $item | awk -F/ '{print $5}' | awk -F. '{print $1}'`
        item_dir=$TOP_DIR/$name
        echo ">>>git pull $name"
        if [ -d $item_dir ]; then
            cd $item_dir
            git pull
            case "$?" in
                0) echo "success.";;
                *) echo "failed.";;
            esac
            cd $TOP_DIR
        else
            echo "$item_dir does not exist"
        fi
    done
}

git_status()
{
    for item in $GITHUB_REPOS; do
        name=`echo $item | awk -F/ '{print $5}' | awk -F. '{print $1}'`
        item_dir=$TOP_DIR/$name
        echo ">>>git status $name"
        if [ -d $item_dir ]; then
            cd $item_dir
            git status $PARAMS
            case "$?" in
                0) echo "success.";;
                *) echo "failed.";;
            esac
        else
            echo "$item_dir does not exist"
        fi
    done
}

git_push()
{
    for item in $GITHUB_REPOS; do
        name=`echo $item | awk -F/ '{print $5}' | awk -F. '{print $1}'`
        item_dir=$TOP_DIR/$name
        echo ">>>git push $name"
        if [-d $item_dir ]; then
            cd $item_dir
            git push
            case "$?" in
                0) echo "success.";;
                *) echo "failed.";;
            esac
        else
            echo "$item_dir does not exist"
        fi
    done
}

git_log()
{
    for item in $GITHUB_REPOS; do
        name=`echo $item | awk -F/ '{print $5}' | awk -F. '{print $1}'`
        item_dir=$TOP_DIR/$name
        echo ">>>git log $name"
        if [ -d $item_dir ]; then
            cd $item_dir
            git log $PARAMS
            case "$?" in
                0) echo "success.";;
                *) echo "failed.";;
            esac
        else
            echo "$item_dir does not exist"
        fi
    done
}

usage()
{
    echo "repo command --  git_repo.sh command"
    echo "repo help    --  ./git_repo.sh help"
    echo "repo clone   --  ./git_repo.sh clone"
    echo "repo pull    --  ./git_repo.sh pull"
    echo "repo status  --  ./git_repo.sh status"
    echo "repo push    --  ./git_repo.sh push"
    echo "repo log     --  ./git_repo.sh log"
}

main()
{
    case $ACTION in
        "clone")
            git_clone;;
        "pull")
            git_pull;;
        "status")
            git_status;;
        "push")
            git_push;;
        "log")
            git_log;;
        "help")
            usage;;
        *)
            usage;
            exit;
    esac
}

main
