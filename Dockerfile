#For Build in Docker
# FROM mcr.microsoft.com/dotnet/core/sdk:2.2 as build-env
# WORKDIR /source
# RUN dotnet restore
# RUN dotnet publish -c Release -o /app/


# RUN mkdir /app/wwwroot/wwwimage/
# RUN mkdir /app/wwwroot/wwwvideos/


FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
ENV IS_DOCKER_ENV=true
WORKDIR /app
COPY . .

# RUN rm -rf /app/wwwroot

# RUN apk update
# RUN apk add libgdiplus-dev fontconfig ttf-dejavu --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted



RUN ln -s /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so

#RUN apt update
#RUN apt install -y libgdiplus
#RUN ln -s /usr/lib/libgdiplus.so /lib/x86_64-linux-gnu/libgdiplus.so

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y --allow-unauthenticated \
        libc6-dev \
        libgdiplus \
        libx11-dev \
        ffmpeg

# RUN set -x \
#     && add-apt-repository ppa:mc3man/trusty-media \
#     && apt-get update \
#     && apt-get dist-upgrade \
#     && apt-get install -y --no-install-recommends \
#         ffmpeg


#EXPOSE 1433

#RUN mkdir /etc/freetds
#RUN touch /etc/freetds/freetds.conf
#RUN echo "[dev01]" > /etc/freetds/freetds.conf
#RUN echo "host = hostname" >> /etc/freetds/freetds.conf
#RUN echo "instance = sqlexpress" >> /etc/freetds/freetds.conf
#RUN echo "tds version = 8.0" >> /etc/freetds/freetds.conf

#RUN touch /home/.sqshrc
#RUN echo "\set username=sa" >  /home/.sqshrc
#RUN echo "\set password=password" >>  /home/.sqshrc
#RUN echo "\set style=vert" >>  /home/.sqshrc

#COPY --from=build-env /app .
# COPY . .


CMD ASPNETCORE_URLS=http://*:$PORT dotnet MovieTemplate.dll awakeservice=true videoprocessservice=true hadoopprocessservice=true > dotnet.log
# CMD ASPNETCORE_URLS=http://*:$PORT dotnet MovieTemplate.dll