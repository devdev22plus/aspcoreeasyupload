#!/bin/bash


docker rmi aspcoreeasyupload
docker rmi $(docker images -qf "dangling=true")
docker rmi $(docker images | grep "aspcoreeasyupload")



#build dotnet
dotnet publish -c Release


docker build -t aspcoreeasyupload -f Dockerfile.arm32 ./bin/Release/netcoreapp3.1/publish
