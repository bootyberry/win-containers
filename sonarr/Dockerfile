# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;
ARG APP_VERSION
ENV SONARR_VERSION ${APP_VERSION}
RUN choco install sonarr --ignore-checksums -y --version $env:SONARR_VERSION;

FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS final
COPY --from=build C:\ProgramData\Sonarr C:\app

EXPOSE 8989
VOLUME [ "C:/config" ]
WORKDIR C:\app\bin
CMD "Sonarr.Console.exe /data=C:\config\"