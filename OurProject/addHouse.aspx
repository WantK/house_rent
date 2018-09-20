<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addHouse.aspx.cs" Inherits="PersonalInfo" %>

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
    <link rel="stylesheet" href="Content/bootstrap.css">
    <link rel="stylesheet" href="Content/bootstrap.min.css">
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
            background:#00cd00;
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
        .div-sidebar{
            width:100%;
            height:inherit;
            background-color:#006bdd;
            text-align:center;
            color:white;

        }
        .div-pinfo{
            width:100%;
            height:200px;
            background-color:#006bdd;
            text-align:center;
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
        }
        .div-shadow{
            box-shadow: 0px 5px 5px #888888;
        }
        .butn2{
            display:none;
        }
        .butn2+label{
            display:block;
            width:100%;
            height:50px;
            margin:0px;
            background:#006bdd;
            border-radius:2px;
            position:relative;
            text-align:center;
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
        }
        .butn2:hover+label{
            display:block;
            width:100%;
            height:50px;
            background:#2f4f4f;
            border-radius:2px;
            position:center;
            text-align:center;
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
        }
        .default-content{
            width:inherit;
        }
        .title-center{
            display:flex;
            flex-direction:column;
            justify-content:center;
            text-align:center;
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
        $(document).ready(function () {
            $("#pinfo").click(function () {
                $("#infopg").fadeIn();
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12 shadow">
                <ul class="nav bg-primary">
                    <li class="nav-item table-hover">
                        <asp:Button ID="Mainpg" CssClass="butn" runat="server" OnClick="Mainpg_Click"/>
                        <label for="Mainpg">主页</label>&nbsp;
                        <!--暂时无法做到按钮分别放置两边-->
                    </li>
                </ul>
            </div>
        </div>
        <div class="wrap">
            <div class="row">
                <div class="col-2 div-sidebar shadow" style="background-color:rgba(0, 107, 221, 0.3);">
                    <div class="div-pinfo" style="background-color:rgba(0, 107, 221, 0);">
                        <asp:Label runat="server" Text="Username" ID="username"></asp:Label>
                        <asp:Label runat="server" Text="Phone:xxxxxx" ID="phone"></asp:Label>
                        <!--修改以上label实现信息显示-->
                    </div>
                    <hr />
                    <button runat="server" class="butn2" id="pinfo">个人信息</button>
                    <label for="pinfo" style="display:none">个人信息</label>
                    <div style="height:inherit; opacity:1;"></div>
                </div>
                <div class="col-8">
                    <div class="row" style="height:100px">
                        <div class="col-2"></div>
                        <div class="col-8 title-center" style="color:white;">
                            <h1>房屋信息录入</h1>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <hr />
                    <div class="row" id="addhouse">
                        <div class="col-1"></div>
                        <div class="col-10 form-data-5p div-inner-padding"">
                            <div class="form-group" style="display:none">
                                <label for="houseid">houseid</label>
                                <input type="text" class="form-control" id="houseid" />
                            </div>
                            <div class="form-group">
                                <label for="province">省份</label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="province" />
                            </div>
                            <div class="form-group">
                                <label for="city">城市</label>
                                <input runat="server" type="text" class="form-control" id="city" />
                            </div>
                            <div class="form-group">
                                <label for="street">街道</label>
                                <input runat="server" type="text" class="form-control" id="street" />
                            </div>
                            <div class="form-group">
                                <label for="price">价格</label>
                                <input runat="server" type="text" class="form-control" id="price" />
                            </div>
                            <div class="form-group">
                                <label for="description">描述</label>
                                <textarea runat="server" class="form-control" rows="5" id="description"></textarea>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8" style="text-align:center">  
                            <asp:Button ID="summit" CssClass="btn btn-primary" runat="server" text="提交" OnClick="summit_Click"/>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row" style="height:100px">
                        <div class="col-2"></div>
                        <div class="col-8 title-center"></div>
                        <div class="col-2"></div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>

        </div>
    </form>
</body>
</html>
