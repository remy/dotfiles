#!/usr/bin/env bash

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
nvm alias default 4

npm install -g json # json cli parser
npm install -g nodemon # cos I use all the time
npm install -g xml2json-command # data mangling
npm install -g servedir # quick static server
npm install -g tap # test shortcut
npm install -g devtool # trace debugging
npm install -g snyk # security
npm install -g snyk-resolve-deps # dep reporting
npm install -g semantic-release-cli # releases
npm install -g grunt-cli # because I have to for some projects
npm install -g live-server systemjs jspm # one day I'll do esnext...
npm install -g peerflix # for testing torrents
npm install -g depcheck # finding unused deps
npm install -g babel-cli
