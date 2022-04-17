# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;

ENV RADARR_VERSION="4.1.0.6175"
RUN choco install radarr --ignore-checksums -y --version $env:RADARR_VERSION;

FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS final
COPY --from=build C:\ProgramData\Radarr C:\app

EXPOSE 7878
VOLUME [ "C:/config" ]
WORKDIR C:\app\bin
CMD "Radarr.Console.exe /data=C:\config\"