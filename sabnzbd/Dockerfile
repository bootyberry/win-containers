# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;
ARG APP_VERSION
ENV SABNZBD_VERSION ${APP_VERSION}
RUN choco install sabnzbd --ignore-checksums -y --version $env:SABNZBD_VERSION;

FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS final
ARG src="C:\Program Files\SABnzbd"
COPY --from=build ${src} C:\app

EXPOSE 8080
VOLUME [ "C:/config" ]
WORKDIR C:\app
CMD "SABnzbd-console.exe --config-file c:\config\SABnzbd.ini"