set -e 

[ -d /var/halfpipe/cache ] && export npm_config_cache="/var/halfpipe/cache/.npm"

npm install
#FIXME: not working since it needs Chrome headless setup for test suite
#npm test 
