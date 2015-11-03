#!/bin/bash   

FULL_PROJECT_PATH=$1

rm post-receive

echo "echo \"\"" >> post-receive
echo "echo \"\"" >> post-receive
echo "" >> post-receive;

echo "echo ========= Cheking Out ========="   >> post-receive
echo "git --work-tree=$FULL_PROJECT_PATH/src --git-dir=$FULL_PROJECT_PATH/repository.git checkout -f" >> post-receive
echo "" >> post-receive;

echo "echo \"\"" >> post-receive
echo "echo \"\"" >> post-receive
echo "" >> post-receive;
echo "" >> post-receive;


echo "echo ========= Deploying =========" >> post-receive

TYPE=$2

if [ $TYPE = "api" ]; then	
	echo "( cd $FULL_PROJECT_PATH/src && composer install )" >> post-receive
fi
if [ $TYPE = "app" ]; then	
	echo "( cd $FULL_PROJECT_PATH/src && npm i && bower i && gulp prod )" >> post-receive
fi

echo "" >> post-receive;
echo "" >> post-receive;

echo "echo \"\"" >> post-receive
echo "echo \"\"" >> post-receive 
echo "echo =========== Complete ===========" >> post-receive
echo "echo \"\"" >> post-receive
echo "echo \"\"" >> post-receive