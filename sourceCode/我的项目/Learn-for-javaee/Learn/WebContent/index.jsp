<%@ page contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta charset="utf-8">  
<title>用户登录界面</title>  
</head>  
<body>  
    <form action="user/showUser"  method="post" style="text-align: center; margin: 80px auto; width: 500px;">  
        <p>用户名:<input type="text" name="uname" /></p>  
        <p>密码:<input type="password" name="upwd" /></p>  
        <input type="submit" value="登录"/>  
    </form>  
      
</body>  
</html>