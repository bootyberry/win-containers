# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
ARG APP_VERSION
ENV TAUTULLI_VERSION ${APP_VERSION}
ENV URI="https://github.com/Tautulli/Tautulli/archive/refs/tags/v${TAUTULLI_VERSION}.zip"

RUN Invoke-WebRequest -Uri $env:URI -OutFile c:\tautulli.zip
RUN Expand-Archive c:\tautulli.zip -DestinationPath C:\tautulli -Force
RUN Rename-Item -Path "c:\tautulli\Tautulli-$env:TAUTULLI_VERSION" -NewName "C:\tautulli\tautulli"

FROM python:3.9-windowsservercore-ltsc2022 AS final
COPY --from=build C:\tautulli\tautulli C:\app

EXPOSE 8181
VOLUME C:\config C:\plexlogs
WORKDIR C:\app\
CMD "python.exe Tautulli.py --datadir=c:\config"