<%@page import="com.ktv.keys.ServerKey"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.*"%>
<%@page import="com.ktv.keys.UserInfoKey"%>
<%@page import="com.ktv.vo.*"%>
<%@page import="com.ktv.util.*"%>
<%@page import="redis.clients.jedis.JedisPool"%>
<%@page import="redis.clients.jedis.Jedis"%>
<%@ page language="java"
	import="java.util.*,java.util.Map.Entry
,org.springframework.web.context.support.*
,org.apache.commons.dbcp.BasicDataSource
,org.springframework.context.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数值修改工具</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>
<body>
	<%
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(getServletContext());
		BasicDataSource dataSource = (BasicDataSource) ctx.getBean("dbrs");
		JedisPool jedisPool = (JedisPool) ctx.getBean("jedisPool");
		request.setCharacterEncoding("UTF-8");
		//115.238.248.163  115.238.248.162

		Jedis jedis = null;
		StringBuffer sb = new StringBuffer();
		try {

			jedis = jedisPool.getResource();
			Map<String, String> userCache = jedis.hgetAll("hroom_ids");
			int index = 0;
			Set<String> set = jedis.smembers(ServerKey.SMEMBER_RTMP_SERVER);
			String rtmps[] = new String[] { "192.168.10.230" };
			if (set != null && set.size() > 0) {
				rtmps = new String[set.size()];
				int i = 0;
				for (String str : set) {
					rtmps[i] = str;
					i++;
				}
			}
			if (userCache != null && userCache.size() > 0) {
				for (Entry<String, String> entry : userCache.entrySet()) {
					int uid = Integer.parseInt(entry.getKey());
					sb.append(uid).append("=");
					// 						String str=rtmps[index%2];
					String rtmp = rtmps[index & rtmps.length];
					sb.append(rtmp).append(",");
					if (rtmp != null && rtmp.length() > 7) {
						rtmp = rtmp.substring(7);
						//						System.out.println("rtmp:"+rtmp);
						int pos = rtmp.indexOf("/");
						if (pos > -1) {
							rtmp = rtmp.substring(0, pos);
							String rtmphost = rtmp;
							String port = "1935";
							int pos2 = rtmp.indexOf(":");
							if (pos2 > -1) {
								rtmphost = rtmp.substring(0, pos2);
								port = rtmp.substring(pos2 + 1);
							}
							jedis.hset("hvediosKtv:" + uid, "rtmp_host",
									rtmphost);
							jedis.hset("hvediosKtv:" + uid, "rtmp_port",
									port);
						}
					}
					//if(uid%2==0){
					/* jedis.hset("hvediosKtv:"+uid,"rtmp_host",str);
					jedis.hset("hvediosKtv:"+uid,"rtmp_port","1935"); */
					index++;
					//}
				}
			}

		} finally {
			jedisPool.returnResource(jedis);
		}
		//out.println(sb.toString());
	%>