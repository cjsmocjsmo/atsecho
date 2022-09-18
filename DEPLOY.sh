#!/bin/sh

rm -rf $HOME/atsflutteradmin;

git clone https://github.com/cjsmocjsmo/atsflutteradmin;

cd $HOME/atsflutteradmin;

flutter clean && flutter build web;

cd;

# rm -rf $HOME/atsecho/atsflutteradmin;

# mkdir $HOME/atsecho/atsflutteradmin;

# cp -pvr $HOME/atsflutteradmin/atsflutteradmin/webDeploy/images $HOME/atsecho/atsflutteradmin/;

# cp -pvr $HOME/atsflutteradmin/atsflutteradmin/webDeploy/video $HOME/atsecho/atsflutteradmin/;

# mv -v $HOME/ats/atsflutteradmin/build/web/* $HOME/ats/atsecho/atsflutteradmin/;

# cd /$HOME/ats/atsecho;

# docker build -t cjsmocjsmo/atsflutteradmin2:0.0.3;

# docker push cjsmocjsmo/atsflutteradmin2:0.0.3;




