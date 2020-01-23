#!/usr/bin/env bash

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm alias default 10

npm install -g xml2json-command # data mangling
npm install -g serve # quick static server
npm install -g tap # test shortcut
npm install -g devtool # trace debugging
npm install -g snyk # security
npm install -g semantic-release-cli # releases
npm install -g live-server # one day I'll do esnext...
npm install -g peerflix # for testing torrents
npm install -g depcheck # finding unused deps
npm install -g babel-cli
npm install -g dev-cert-authority # add self signed certs for custom domains
npm install -g now # deploy
npm install -g npx # run stuff

# mine
npm install -g nodemon # cos I use all the time
npm install -g @remy/envy # cos I use all the time
npm install -g @remy/webmention # webmentions
npm install -g jsonbin # jsonbin storage
npm install -g express-router-cli # my simplified router
npm install -g @remy/remarker # my slide runner
