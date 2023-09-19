
# --------------------------------------- #
#  				 重置函数脚本			  #
# --------------------------------------- #

# ------------------函数定义区----------------- #

# 创建 /etc/docker/ 目录
function mkdir_etc_docker(){
	
	docker_etc_path=/etc/docker

	# 如果目录不存在则创建
	if [ ! -d $docker_etc_path ];then
		echo -e "\e[93m$docker_etc_path \e[96m目录不存在，现在创建....\n \e[0m"
		# 创建目录
		sudo mkdir -p $docker_etc_path

		# 检测目录是否创建成功
		if [ $? == 0 ];then
			echo -e "\e[92m$docker_etc_path \e[96m创建成功！\n \e[0m"
		else
			echo -e "\e[93m$docker_etc_path \e[96m创建失败！\n \e[0m"
		fi
	else
		echo -e "\e[92m$docker_etc_path \e[96m目录已存在！\n \e[0m"
	fi

}

# 生成配置文件
function generate_config(){

	# 设置镜像或代理
	sudo tee /etc/docker/daemon.json <<-'EOF'
	{
		"registry-mirrors": [
			"https://dockerproxy.com",
			"http://hub-mirror.c.163.com",
			"https://mirror.baidubce.com/"
		]
	}
	EOF


}

# 重置
function reset_docker(){
	
	docker_etc_path=/etc/docker
	
	# 停止 docker 服务
	echo -e "\e[96m停止 docker 服务...\n \e[0m"
	sudo systemctl stop docker
	
	echo -e "\e[96m开始重置docker...\n \e[0m"
	# 如果存在 /etc/docker 目录将删除此目录
	if [ -d $docker_etc_path ];then
		echo -e "\e[96m开始删除 \e[92m$docker_etc_path \e[96m目录...\n \e[0m"
		sudo rm -rf $docker_etc_path
	else
		echo -e "\e[92m$docker_etc_path \e[96m目录不存在，不用删了！\n \e[0m"
	fi
	
	# 生成 /etc/docker 目录
	echo -e "\e[96m重新生成 \e[92m $docker_etc_path \e[96m目录...\n \e[0m"
	mkdir_etc_docker

	# 生成 docker 配置文件
	echo -e "\e[96m生成 \e[92m daemon.json \e[96m配置文件...\n \e[0m"
	generate_config
	

	# 重启 docker 服务
	echo -e "\e[96m启动 docker 服务...\n \e[0m"
	sudo systemctl start docker

}



# 初始化
# function init_docker(){
# 
# }





# ---------------------测试-------------------- #

# mkdir_etc_docker

# reset_docker


