# docker php 8.3
# docker exec -it d_php83 sh -c "php $*"
cmd_str="/usr/local/bin/*"
docker exec -it d_php83 sh -c "$cmd_str $*"
