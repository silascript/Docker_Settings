# docker php 容器调用通用函数

# Docker PHP 容器执行函数
# 函数1：容器名称，如d_php85 函数2...n：要调用容器中/usr/local/bin目录下可执行文件及参数
# 调用示例：
# 调用名为d_php85的容器中 /usr/local/bin目录下的php可执行文件,启动php内置的服务器
# php -S ip -t 目录 这一串参数是PHP开启内置服务器的命令及参数
# docker_cmds/docker_php.sh d_php85 php -S 172.21.0.30:8088 -t /var/www/html
function docker_php_exec() {

	# 判断参数个数
	if [[ $# -eq 0 ]]; then
		echo -e "\e[93m必须输入一个要查询的字符串! \n \e[0m"
		return
	fi
	# 获取第一个参数，即Docker 容器名称
	local docker_container_name=$1

	# 移除第一个参数
	shift

	# 执行容器脚本
	local cmd_str="/usr/local/bin"
	docker exec -it "$docker_container_name" sh -c "$cmd_str/$*"
	#docker exec -it d_php84 sh -c "$cmd_str/$*"
	# docker exec -it d_php84 sh -c "php $*"
}

# docker_php_exec "$@"
# cmd_str="/usr/local/bin"
# docker exec -it d_php85 sh -c "$cmd_str/$*"
