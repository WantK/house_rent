<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderPage.aspx.cs" Inherits="orderPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>order</title>
    <link href="StyleSheet2.css" rel="stylesheet" /> 
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
    <div class="wrap">
        <div id="hook"></div>
        <div class="form-data">
            <div class="all">
                <div class="form form1">
                    <p class="p-input pos">
                        <label for="txtHomeId">房屋编号: </label>
                        <asp:Label Text="text" runat="server" ID="txtHomeId"/>
                    </p>
                    <p class="p-input pos">
                        <label for="txtHomeAdd">房屋地址: </label>
                        <asp:Label Text="text" runat="server" ID="txtHomeAdd"/>
                    </p>
                    <p class="p-input pos">
                        <label for="txtHomePay">房屋租金: </label>
                        <asp:Label Text="text" runat="server" ID="txtHomePay"/>
                    </p>
                    <p class="p-input pos">
                        <label for="txtHomeDes">房屋描述: </label>
                        <asp:Label Text="text" runat="server" ID="txtHomeDes"/>
                    </p>
                    <p class="p-input pos">
                        <label for="charge">手续费: </label>
                        <span id="charge"></span>
                    </p>
                </div>
                <div class="form form1">
                    <p class="p-input pos">
                        <label for="txtHomeOwnerPhone">户主电话: </label>
                        <asp:Label Text="text" runat="server" ID="txtHomeOwnerPhone"/>
                    </p>
                    <p class="p-input pos">
                        <label for="houmeRate">手续费收费标准: </label>
                        <span id="homeRate">租金 × 2 %</span>
                    </p>
                    
                   <div class="timeInput">
                        <h2>租用时间选定</h2>
                        <p class="p-input pos">
                            <label for="txtStartTime">开始日期</label>
                            <input id="txtStartTime" type="date" autocomplete="off" />
                        </p>
                        <p class="p-input pos">
                            <label for="txtEndTime">续租日期</label>
                            <input id="txtEndTime" type="date" autocomplete="off"/>
                        </p>
                    </div>
                </div>
                <div class="form form2">
                    <asp:Button Text="报告问题" runat="server" CssClass="lang-btn float2"/>
                    <asp:Button Text="留言房主" runat="server" CssClass="lang-btn float2"/>
                    <input id="Button" type="button" value="确认订单" runat="server" class="lang-btn float1" onclick="get_time()"/>
                   
                </div>
            </div>
        </div>
         </div>
    </form>
   
    <script>
        function rate()
        {
            var charge = document.getElementById("charge");
            var innerPay = document.getElementById("txtHomePay");
            charge.innerText = (innerPay.innerText) * 0.02;
        }
        rate();
    </script>
    <script>
    function get_time() {
        var startTime = document.getElementById("txtStartTime").value;
        var endTime = document.getElementById("txtEndTime").value;
        var txtHomeId = document.getElementById("txtHomeId").innerText;
        var txtHomeAdd = document.getElementById("txtHomeAdd").innerText;
        var txtHomePay = document.getElementById("txtHomePay").innerText;
        var txtHomeOwner = document.getElementById("txtHomeOwnerPhone").innerText;
        var txtHomeDes = document.getElementById("txtHomeDes").innerText;
        var redict_str = "PersonalInfo.aspx?startTime="+startTime+"&endTime="+endTime+
            "&txtHomeId="+txtHomeId+"&txtHomeAdd="+txtHomeAdd+"&txtHomePay="+txtHomePay+"&txtHomeOwner="+txtHomeOwner
            +"&txtHomeDes="+txtHomeDes+"&action=true&userName="+GetUrlParam("userName");
        window.location.href=redict_str;
    }
</script>

</body>
   

</html>
