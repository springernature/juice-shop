set -e 

[ -d /var/halfpipe/cache ] && export npm_config_cache="/var/halfpipe/cache/.npm"

npm install
npm test
