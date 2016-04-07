转换脚本刚跑完，所以数据会不一样，需要重新预热数据：
第一：清空redis的数据；
第二：配置脚本配置文件，跑脚本预热数据
           1、首先启动 服务端：php service.php
            2、用client发送预热命令：php client.php  +选项
            3、log.txt 日子可以看到进度 ，tailf 查看，看到结束提示即可发送下一个选项

具体选项说明：
* member_status (这步必须先跑完之后才能跑其他的）

    member :                    预热用户表的'主表'的信息
    member_count :              预热用户的积分等统计信息
    member_profile :            预热用户的详细信息
    member_field_home :         预热用户的个人中心的信息

    【用户hash】
    hash_user                   用户名和用户的邮箱的hash表 主要用于登陆注册 持久化的

    【帖子】
    forum_thread :              预热主题信息
    forum_post :                预热帖子信息,每十条一个key,最近多少月的数据请配置起始tid

    【主题列表】
    thread_set                  主题列表的有序集合 用户提高列表的翻页性能问题


以上选项除了第一个member_status 外，其他是可以同时跑的，但最好是逐个执行选项，因为每个选项启动进程较多，如果发送多个反而降低预热速度