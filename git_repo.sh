# File Name: git_repo.sh
# Author: Louis Xu
# mail: louis_xu_ustc@163.com
# Created Time: 03/10/16
#!/bin/bash

CMD=$0
ACTION=$1

GITHUB_REPOS="https://github.com/louis-xu-ustc/Backup.git  \
              https://github.com/louis-xu-ustc/CppPrimer.git   \
              https://github.com/louis-xu-ustc/LeetCode.git    \
              https://github.com/louis-xu-ustc/MotionDetection.git \
             "

TOP_DIR=`pwd`

git_clone()
{
    for item in $GITHUB_REPOS; do
        echo "git clone $item"
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
        name=`echo $item | awk -F/ `{print $5}` | awk -F. `{print $1}``
        item_dir=$TOP_DIR/$name
        echo "git pull $item"
        if [-d $item_dir]; then
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

usage()
{
    echo "repo louis-xu-ustc github"
}

main()
{
    case $ACTION in
        "clone")
            git_clone;;
        "pull")
            git_pull;;
        *)
            usage;
            exit;
    esac
}

main
