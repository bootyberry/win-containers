# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
ARG APP_VERSION
ENV OMBI_VERSION ${APP_VERSION}
ENV URI="https://github.com/Ombi-app/Ombi/releases/download/v${OMBI_VERSION}/win10-x64.zip"

RUN Invoke-WebRequest -Uri $env:URI -OutFile c:\ombi.zip
RUN Expand-Archive c:\ombi.zip -DestinationPath C:\ombi -Force

FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS final
COPY --from=build C:\ombi C:\app

EXPOSE 5000
VOLUME [ "C:/config" ]
WORKDIR C:\app\
CMD "Ombi.exe --storage C:\config\"