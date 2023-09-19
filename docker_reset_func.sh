
# --------------------------------------- #
#  				 重置函数脚本			  #
# --------------------------------------- #

# ------------------函数定义区----------------- #

# 创建 /etc/docker/ 目录
function mkdir_etc_docker(){
	
	docker_ect_path=/etc/docker

	# 如果目录不存在则创建
	if [ ! -d $docker_ect_path ];then
		echo -e "\e[93m$docker_ect_path \e[96m目录不存在，现在创建....\n \e[0m"
		# 创建目录
		sudo mkdir -p $docker_ect_path

		# 检测目录是否创建成功
		if [ $? == 0 ];then
			echo -e "\e[92m$docker_ect_path \e[96m创建成功！\n \e[0m"
		else
			echo -e "\e[93m$docker_ect_path \e[96m创建失败！\n \e[0m"
		fi
	else
		echo -e "\e[92m$docker_ect_path \e[96m目录已存在！\n \e[0m"
	fi

}


# 设置镜像或代理
function set_proxy(){

	sudo tee /etc/docker/daemon.json <<-'EOF'
	{
		"registry-mirrors": [
			"https://dockerproxy.com",
			"http://hub-mirror.c.163.com",
		]
	}
	EOF


}




# 初始化
# function init_docker(){
# 
# }





# ---------------------测试-------------------- #

mkdir_etc_docker



