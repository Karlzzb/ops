1. 本脚本主要用来收集域名的相关信息，主要包括： IP, 域名注册商，创建时间，更新时间，过期时间，网站是否可以访问，以及在大陆的连通率
2. 依赖包以及模块的安装:
   pip install requests
   pip install jinja2
   yum install jwhois
   yum install GeoIP
	
3. 脚本组成部分主要有以下：
    dns_avai_check.py   # 主要执行程序及入口
    domain_list         # 文本格式存储的域名列表
    css\*               # css 样式
    js\*                # js 脚本
    templates\dns_available_check.j2   # Jinja2 html模板文件，主要用来定义生成页面的样式

4. 怎么使用: 
    运行命令   python dns_avai_check.py 
    将会生成一个html页面在当前路径， 文件名： dns_available_check.html