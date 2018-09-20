<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link href="StyleSheet3.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/bootstrap.css"/>
    <link rel="stylesheet" href="Content/bootstrap.min.css"/>
    <style>
        .lower-border{
            border:hidden;
            border-bottom:thin;
        }
        .ul-horizontal{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            background: #333;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }
        li a {
            display: block;
            color: #000;
            text-decoration: none;
        }
        /* 鼠标移动到选项上修改背景颜色 */
        li a:hover {
            background-color: #555;
            color: white;
        }
        .regular-checkbox {
	        display: none;
        }

        .regular-checkbox + label {
	        background-color: #fafafa;
	        border: 1px solid #cacece;
	        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
	        padding: 9px;
	        border-radius: 3px;
	        display: inline-block;
	        position: relative;
        }

        .regular-checkbox + label:active, .regular-checkbox:checked + label:active {
	        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }

        .regular-checkbox:checked + label {
	        background-color: #e9ecee;
	        border: 1px solid #adb8c0;
	        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
	        color: #99a1a7;
        }

        .regular-checkbox:checked + label:after {
	        content: '\2714';
	        font-size: 14px;
	        position: absolute;
	        top: 0px;
	        left: 3px;
	        color: #99a1a7;
        }
        .chk{
            display:none;
        }
        .chk+label{
            display:block;
            width:auto;
            height:auto;
            background:#ffffff;
            border-radius:2px;
            position:relative;
            text-align:center;
        }
        .chk:checked+label{
            display:block;
            width:auto;
            height:auto;
            background:#3499da;
            border-radius:2px;
            position:center;
            text-align:center;
            color:white;
        }
        .butn{
            display:none;
        }
        .butn+label{
            display:block;
            width:100px;
            height:100%;
            margin:0px;
            opacity:1;
            border-radius:2px;
            position:relative;
            text-align:center;
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
        }
        .butn:hover+label{
            display:block;
            width:100px;
            height:100%;
            background:#2f4f4f;
            border-radius:2px;
            position:center;
            text-align:center;
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
        }
        .form-data-5p{
            background-color:#fff;
            border-radius:5px;
            box-shadow:0px 0px 30px rgba(0,0,0,10);
        }
        .div-inner-padding{
            padding: 25px;
        }
        .element-in-left{
            position:absolute;
            left:10px;
        }
        .element-in-right{
            position:absolute;
            right:10px;
        }
    </style>
    <script>
        function GetUrlParam(paraName) {
            var url = document.location.toString();
            var arrObj = url.split("?");

            if (arrObj.length > 1) {
                var arrPara = arrObj[1].split("&");
                var arr;

                for (var i = 0; i < arrPara.length; i++) {
                    arr = arrPara[i].split("=");

                    if (arr != null && arr[0] == paraName) {
                        return arr[1];
                    }
                }
                return "";
            }
            else {
                return "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12">
                <ul class="nav bg-primary justify-content-end" style="background-color:#3499da;box-shadow:0px 0px 30px rgba(0,0,0,10);">
                    <li class="nav-item table-hover">
                        <asp:Button ID="Mainpg" CssClass="butn" runat="server" OnClick="Mainpg_Click"/>
                        <label for="Mainpg">我的主页</label>&nbsp;
                    </li>
                    <li class="nav-item table-hover">
                        <asp:Button ID="Login" CssClass="butn" runat="server" OnClick="Login_Click"/>
                        <label for="Login" id="lgnLbl" runat="server">登录</label>&nbsp;
                    </li>
                    <li class="nav-item table-hover">
                        <asp:Button ID="Signup" CssClass="butn" runat="server" OnClick="Signup_Click"/>
                        <label for="Signup" id="signupLbl" runat="server">注册</label>&nbsp;
                    </li>
                    <li class="nav-item table-hover">
                        <asp:Button ID="Logout" CssClass="butn" runat="server" OnClick="Logout_Click" />
                        <label for="Logout" id="lgoutLbl" style="display:none">退出登录</label>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="wrap">
            <div style="height:50px;"></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8 form-data-5p div-inner-padding">
                    <div class="row">
                        <div class="col-2">
                            地点
                        </div>
                        <div class="col-6">
                        <div class="row">
                            <input type ="checkbox" id="Xian" class="chk"  runat="server" onclick ="check
        box1"/>
                            <label for="Xian">西安</label>&nbsp;&nbsp;
                            <input type ="checkbox" id="Chengdu" class="chk" runat="server" />
                            <label for="Chengdu">成都</label>&nbsp;&nbsp;
                            <input type ="checkbox" id="Chongqing" class="chk" runat="server" />
                            <label for="Chongqing">重庆</label>&nbsp;&nbsp;
                        </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-2">
                            价格
                        </div>
                        <div class="col-6">
                        <div class="row">

                            <asp:TextBox ID="fromPrice" runat="server" Width="74px"></asp:TextBox>
                            &nbsp;to&nbsp;<asp:TextBox ID="toPrice" runat="server" Width="76px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="确定" CssClass="lang-btn btn2"/>
                        </div>
                        </div>
                    </div>
                    <hr />
                
                    
                
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-hover" id="HouseList">
                                <thead class="thead-light">
                                    <tr data-toggle="modal" data-target="#myModal">
                                        <th style="display:none">HouseId</th>
                                  
                                        <th>省份</th>
                                        <th>城市</th>
                                        <th>街道</th>
                                        <th>描述</th>
                                        <th>房主</th>
                                        <th>价格</th>
                                        <th>详情</th>
                                    </tr>
                                </thead>
                                <tbody runat="server">
                                     <asp:Repeater ID="Repeater1" runat="server">
                           
                                <ItemTemplate>
                                    <tr>
                                        <td style="display:none"><%#Eval("HouseId")%></td>
                                        <td style="display:none"><%#Eval("userId")%></td>
                                        <td><%#Eval("Province")%></td>
                                        <td><%#Eval("City") %></td>
                                        <td><%#Eval("Street") %></td>
                                        <td><%#Eval("description")%></td>
                                        <td><asp:Label ID ="lb_Hoster" runat="server" Text=""></asp:Label></td>
                                        <td><%#Eval("Price")  %></td>
                                    
                                    </tr>

                                </ItemTemplate>
                                </asp:Repeater>
                                </tbody>
                            </table>
                       <asp:Label ID ="lb_userName" runat="server" Text="" style="display:none"></asp:Label>
                       
                        </div>
                    </div>
                </div>
            
                <div class="col-2"></div>
            </div>
        </div>
        

        <!-- 模态框 -->
        <div class="modal fade" id="myModal">
          <div class="modal-dialog">
            <div class="modal-content">
 
              <!-- 模态框头部 -->
              <div class="modal-header">
                <h4 class="modal-title">模态框头部</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
 
              <!-- 模态框主体 -->
              <div class="modal-body">
                模态框内容..
              </div>
 
              <!-- 模态框底部 -->
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
              </div>
 
            </div>
          </div>
            
        </div>
       
    </form>
</body>
     <script type="text/javascript">
         if ((GetUrlParam("userName") != "")) {
             var lgn = document.getElementById("lgnLbl");
             lgn.style = "display:none";
             var signup = document.getElementById("signupLbl");
             signup.style = "display:none";
             var logout = document.getElementById("lgoutLbl");
             logout.style = null;
             var table = document.getElementById("HouseList");
             var rows = table.rows;
             for (var i = 1; i < rows.length; i++) {
                 var td = document.createElement("td");
                 var start = "<a href=\""
                 var end = "\">订购</a>"
                 var href = "orderPage.aspx?HouseId=" + rows[i].cells[0].innerHTML + "&userId=" + rows[i].cells[1].innerHTML + "&userName=" + document.getElementById("lb_userName").innerText;
                 td.innerHTML = start + href + end;
                 rows[i].appendChild(td)
             }
         }
</script>

</html>
