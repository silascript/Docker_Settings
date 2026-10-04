# Docker PHP 容器调用通用脚本

# 引入通用函数
source ./docker_php_func.sh

# 参数：
# 1. PHP容器名称
# 2. 要调用PHP容器中/usr/local/bin目录下可执行程序及所需传入的参数
docker_php_exec "$@"
