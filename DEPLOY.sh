#!/bin/sh

rm -rf $HOME/atsflutteradmin;

cd $HOME;

git clone https://github.com/cjsmocjsmo/atsflutteradmin;

cd $HOME/atsflutteradmin;

flutter clean && flutter build web;

cd $HOME;

rm -rf $HOME/atsecho/atsflutteradmin;

mkdir $HOME/atsecho/atsflutteradmin;

cp -pvr $HOME/atsflutteradmin/atsflutteradmin/webDeploy/images $HOME/atsecho/atsflutteradmin/;

cp -pvr $HOME/atsflutteradmin/atsflutteradmin/webDeploy/video $HOME/atsecho/atsflutteradmin/;

cp -pvr $HOME/atsflutteradmin/build/web/* $HOME/atsecho/atsflutteradmin/;

cd $HOME/atsecho;

docker build -t cjsmocjsmo/atsflutteradmin2:0.0.3;

# docker push cjsmocjsmo/atsflutteradmin2:0.0.3;




