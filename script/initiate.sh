#!/bin/sh

if [ -z $1 ]
then
    echo "Does not add parameter."; exit 1;
fi

if [ -z $ENV_APP_NAME ]
then
    echo "Did not set environment variable ENV_APP_NAME."; exit 1;
fi

IMAGE_NAME=heroku-docker
PORT=8000
APP_NAME=$ENV_APP_NAME

if [ $1 = "build" ]
then

    docker build -t ${IMAGE_NAME} .

elif [ $1 = "run" ]
then

    docker run -p ${PORT}:${PORT} -e PORT=${PORT} ${IMAGE_NAME}

elif [ $1 = "test" ]
then

    curl localhost:${PORT}

elif [ $1 = "remove" ]
then

    docker rm -f $(docker ps -aq)

elif [ $1 = "push" ]
then

    heroku container:push -a ${APP_NAME} web

elif [ $1 = "release" ]
then

    heroku container:release -a ${APP_NAME} web

else
    echo 'Does not recognize the command.'
fi
