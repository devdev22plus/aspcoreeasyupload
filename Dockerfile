FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
ENV IS_DOCKER_ENV=true
WORKDIR /app
COPY . .




CMD ASPNETCORE_URLS=http://*:$PORT dotnet aspcoreeasyupload.dll > dotnet.log