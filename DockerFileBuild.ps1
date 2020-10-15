## This will have the build commands that we want to run


## Set location of build
Set-Location C:\dockeragent

## Builds image based on dockerfile, we can have seperate images for Agent1,2 and 3
docker build -t win2019:agent1 .\Agent1 -m16

## Builds image based on dockerfile, we can have seperate images for Agent1,2 and 3
docker build -t win2019:agent2 .\Agent2

## Builds image based on dockerfile, we can have seperate images for Agent1,2 and 3
docker build -t win2019:agent3 .\Agent3

## Get ready to run and connect container to DevOps 
$Agent1 = docker run -e AZP_URL=https://ssw2.visualstudio.com -e AZP_TOKEN=nfmngxjt5kjkw75sgmyhstp2ivqkdcfunoecq733piuw7zz4jwqa -e AZP_POOL=Steven-TestDocker -e AZP_AGENT_NAME=Agent1 win2019:agent1 
$Agent2 = docker run -e AZP_URL=https://ssw2.visualstudio.com -e AZP_TOKEN=nfmngxjt5kjkw75sgmyhstp2ivqkdcfunoecq733piuw7zz4jwqa -e AZP_POOL=Steven-TestDocker -e AZP_AGENT_NAME=Agent2 win2019:agent2 
$Agent3 = docker run -e AZP_URL=https://ssw2.visualstudio.com -e AZP_TOKEN=nfmngxjt5kjkw75sgmyhstp2ivqkdcfunoecq733piuw7zz4jwqa -e AZP_POOL=Steven-TestDocker -e AZP_AGENT_NAME=Agent3 win2019:agent3 

$Agent1
$Agent2
$Agent3