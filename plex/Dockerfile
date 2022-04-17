# escape=`
FROM mcr.microsoft.com/windows/server:ltsc2022
COPY setup C:\setup
WORKDIR C:\setup
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN Install-WindowsFeature Server-Media-Foundation
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;
RUN choco install plexmediaserver --ignore-checksums -y
RUN reg import config.reg


EXPOSE 32400/tcp
VOLUME C:\config
CMD ["cmd.exe", "/S", "/C", "entrypoint.cmd"]