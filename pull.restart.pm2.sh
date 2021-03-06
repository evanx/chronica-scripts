
  rm -f ~/.pm2/logs/chronica-*

  [ -f  ~/.chronica.yaml ] || exit 1

  cat index.js | grep -q evanxsummers || exit 1

  git pull
  git submodule update

  node_modules/pm2/bin/pm2 restart chronica

  node_modules/pm2/bin/pm2 show chronica

  sleep 2

  ls --sort=time ~/.pm2/logs/chronica-err-*.log |
     head -1 | xargs cat |
     node_modules/bunyan/bin/bunyan

  ls --sort=time ~/.pm2/logs/chronica-out-*.log |
     head -1 | xargs tail -f |
     node_modules/bunyan/bin/bunyan
