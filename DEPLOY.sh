#!/bin/sh

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/assets;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/canvaskit;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/images;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/video;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/icons;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/*.json;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/*.js;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/*.html;

rm -rf $HOME/atsDeployments/atsflutterAdminWebDeploy/*.png;

cp -pvr $HOME/ats/atsflutterImageContainer/images $HOME/atsDeployments/atsflutterAdminWebDeploy/;

cp -pvr $HOME/ats/atsflutterImageContainer/video $HOME/atsDeployments/atsflutterAdprintminWebDeploy/;

cd $HOME/ats/atsflutteradmin;

flutter clean && flutter build web;

cd;

mv -v $HOME/ats/atsflutteradmin/build/web/* $HOME/ats/atsecho/atsflutteradmin/;

cd /$HOME/ats/atsecho;

docker build -t cjsmocjsmo/atsflutteradmin2:0.0.3;

# docker push cjsmocjsmo/atsflutteradmin2:0.0.3;




