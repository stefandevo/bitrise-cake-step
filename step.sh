#!/bin/bash

if [ ${dotnetcore} == "yes" ]
then
  echo "Installing .net core"

  wget https://raw.githubusercontent.com/dotnet/cli/rel/1.0.1/scripts/obtain/dotnet-install.sh
  chmod +x dotnet-install.sh
  ./dotnet-install.sh 
  
  ln -s /Users/vagrant/.dotnet/dotnet /usr/local/bin/dotnet

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  dotnet --version
fi

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/osx

echo "Executing Cake"
chmod +x build.sh
./build.sh -s ${script} -t ${target} -c ${configuration} -v ${verbosity}