# escape=`
FROM mcr.microsoft.com/windows/servercore:ltsc2022 AS build
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
ARG APP_VERSION
#ENV LAZYLIBRARIAN_VERSION ${APP_VERSION}
#ENV URI="https://gitlab.com/LazyLibrarian/LazyLibrarian/-/archive/${LAZYLIBRARIAN_VERSION}/LazyLibrarian-${LAZYLIBRARIAN_VERSION}.zip"
ENV URI="https://gitlab.com/LazyLibrarian/LazyLibrarian/-/archive/master/LazyLibrarian-master.zip"
RUN Invoke-WebRequest -Uri $env:URI -OutFile c:\lazylibrarian.zip
RUN Expand-Archive c:\lazylibrarian.zip -DestinationPath C:\lazylibrarian -Force
RUN Rename-Item -Path "C:\lazylibrarian\lazylibrarian-master" -NewName "C:\lazylibrarian\lazylibrarian"

FROM python:3.9-windowsservercore-ltsc2022 AS final
COPY --from=build C:\lazylibrarian\lazylibrarian C:\app
RUN pip install --upgrade pip
RUN pip install urllib3 charset_normalizer certifi idna apprise Pillow pyOpenSSL

EXPOSE 5299
VOLUME C:\config
WORKDIR C:\app\
CMD "python.exe LazyLibrarian.py --datadir=c:\config"