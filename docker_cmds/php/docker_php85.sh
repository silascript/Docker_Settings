# 调用php8.5容器可执行脚本


# 引入调用PHP容器可执行的通用脚本
source ./docker_php_func.sh

# 调用函数
# 参数1：容器名
# 参数2...n：要调用的命令及参数
# 调用示例：./docker_php85.sh php -S 172.21.0.30:8088 -t /var/www/html
docker_php_exec d_php85 "$@"



