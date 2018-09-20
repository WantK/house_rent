<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title>Registration</title>
    <script type="text/ecmascript" src="./Scripts/md5.js"></script>
    <script type="text/javascript">

        function isPWDright() {          
            var pwd = document.getElementById("txtUserPWD");
            var pwd1 = document.getElementById("txtUserPWD1");
            if (pwd.value != pwd1.value) {
                alert("密码不一致，请重新确认");
            }
        }
        function btnReset() {
            var val = document.getElementsByTagName("input");
            for (h = 0; h < val.length; h++) {
                val[h].value = null;
            }
        }
        function show() {
            var elements = form.elements;
            for (var i = 0; i < elements.length-3; i++) {
                if (elements[i].value === "") {
                    alert("请完成表单");
                    return
                }
            }

            
            var userName = form.userName.value;
            var pwd = hex_md5(form.pwd.value);
            var tel = form.tel.value;
            var address = form.address.value;
            var email = form.email.value;
            var str = "?userName=" + userName + "&pwd=" + pwd + "&tel=" + tel + "&address=" + address + "&email=" + email;
         
            window.location.href = "login.aspx"+str;
        }
    </script>
</head>
<body>
    <form id="form1" name="form">
    <div id="hook"></div>
        <div class="wrap">
            
                <div class="form-data pos">
                    <div class="form1">
                        <p class="p-input pos">

                            <input id="userName" type="text" placeholder="用户名" name="userName"/>
                        </p>
                        <p class="p-input pos">
                            
                            <input id="txtUserPWD" type="password" placeholder="密码" name="pwd" autocomplete="off"/>
                        </p>
                        <p class="p-input pos">
                            <input id="txtUserPWD1" placeholder="确认密码" type="password" onblur="isPWDright()"/>
                        </p>
                        <p class="p-input pos">
                            <input id="txtAddress" placeholder="地址" name="address" type="text"/>
                        </p>
                        <p class="p-input pos">
                            <input id="txtUserTel" placeholder="手机号" name="tel" type="tel" />
                        </p>
                        <p class="p-input pos">
                            <input id="txtUserEmail" placeholder="邮箱" name="email" type="email" />
                        </p>
                        <div class="reg_checkboxline pos">
                            <span class="z"><i class="icon-ok-sign boxcol" nullmsg="请同意!"></i></span>
                            <input name="agree" type="hidden" value="1">
                            <div class="Validform_checktip"></div>
                            <p>我已阅读并接受 <a href="#" target="_brack">《房屋租赁条例》</a></p>
                        </div>
                        <div style="width:340px; height:50px; margin:0 auto;">
                            <button class="lang-btn off" style="float:left" onclick="btnReset()">reset</button>
                            <button class="lang-btn off" type="button" style="float:right" onclick="show()">start</button>
                        
                    </div>
                </div>
            
        </div>

    </div>
    </form>
</body>

</html>

