#!/bin/sh

if [ -z $1 ]
then
    echo "Does not add parameter."; exit 1;
fi

IMAGE_NAME=heroku-docker
PORT=8000

if [ $1 = "build" ]
then

    docker build -t ${IMAGE_NAME} .

elif [ $1 = "run" ]
then

    docker run -p ${PORT}:${PORT} -e PORT=${PORT} ${IMAGE_NAME}

elif [ $1 = "test" ]
then

    curl localhost:${PORT}

else
    echo 'Does not recognize the command.'
fi
