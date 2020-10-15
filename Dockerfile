## Select this image to build
FROM mcr.microsoft.com/windows/servercore:ltsc2019-amd64

## In this directory sets the directory for any following commands
WORKDIR /azp

## Copy starts.ps1 to the working directory mentioned above
COPY start.ps1 .

CMD powershell .\start.ps1

## Set powershell as the default for running commands
SHELL ["powershell"]

## RUN the following commands installing .NET 4.7
RUN Enable-WindowsOptionalFeature -Online -FeatureName NetFx4ServerFeatures
RUN Enable-WindowsOptionalFeature -Online -FeatureName NetFx4

RUN New-Item -ItemType File -Force $profile -Value '#creating an empty profile so chocolatey refreshenv will work'; \
    Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    . $profile; \
    choco install -y visualstudio2019enterprise; \
    choco install -y visualstudio2019testagent; \
    choco install -y visualstudio2019buildtools; \
    choco install -y typescript-vs2017-vs2019; \
    choco install -y typescript-vs2015; \
    choco install -y typescript-vs2017; \
    choco install -y webdeploy; \
    choco install -y nuget.commandline; \
    choco install -y azure-pipelines-agent; \
    choco install -y nodejs; \
    choco install -y yarn; \
    choco install -y dotnetcore-sdk;