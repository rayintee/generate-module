# generate-module 系统通用模块

## Description 系统功能描述
    generate-module系统日志权限等通用模块，可方便集成系统其他模块。
    
    
## 系统架构设计：
		spring framework 3.2.2.RELEASE
		spring data jpa 1.3.0.RELEASE
		spring MVC 3.2.2.RELEASE
		shiro 1.2.2.RELEASE
		jquery、bootstrap等js ui


## 数据库设计：
		采用mysql 5.5 数据库
		涉及到的表：sys_user(系统用户表)、sys_role(系统角色表)、sys_menu(系统菜单表)、sys_user_role(系统用户角色表)、
		sys_role_menu(系统角色菜单表)、sys_log(系统日志表)
		详细表结构参见：src/main/resources/database/comm_sys_manager.sql 文件
