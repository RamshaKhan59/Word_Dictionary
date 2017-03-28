<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="Dictionary.AdminPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>My Dictionary</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Esteem Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //custom-theme -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/export.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/flipclock.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/circles.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style_grid.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <style>
        .mylist {
        
        overflow:scroll;height:140px
        }
    </style>
</head>
<body>
    <form runat="server">
      <%--  <asp:ScriptManager runat="server" ID="script1" EnablePageMethods = "true"></asp:ScriptManager>
      --%>  <asp:ToolkitScriptManager runat="server" ID="ScriptManager1" EnablePageMethods = "true"></asp:ToolkitScriptManager>
        <!-- banner -->
        <div class="wthree_agile_admin_info">
            <!-- /w3_agileits_top_nav-->
            <!-- /nav-->
            <div class="w3_agileits_top_nav">
                <ul id="gn-menu" class="gn-menu-main">
                    <!-- /nav_agile_w3l -->
                    <li class="gn-trigger">
                        <a class="gn-icon gn-icon-menu"><i class="fa fa-bars" aria-hidden="true"></i><span>Menu</span></a>
                        <nav class="gn-menu-wrapper">
                            <div class="gn-scroller scrollbar1">
                                <ul class="gn-menu agile_menu_drop">
                                    <li><a href="Dictionary.aspx"><i class="fa fa-files-o"></i>Home</a></li>
                                    <li>
                                        <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i>Dictionary <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                        <ul class="gn-submenu">
                                            <li class="mini_list_agile"><a href="#addwords"><i class="fa fa-caret-right" aria-hidden="true"></i>Add Words</a></li>
                                            <li class="mini_list_w3"><a href="#addwords"><i class="fa fa-caret-right" aria-hidden="true"></i>Edit Words</a></li>
                                            <li class="mini_list_w3"><a href="#addwords"><i class="fa fa-caret-right" aria-hidden="true"></i>Delete Words</a></li>
                                        </ul>
                                    </li>


                                    <li><a href="#" runat="server" id="logout" onserverclick="logout_ServerClick"><i class="fa fa-cogs" aria-hidden="true"></i>Logout</a></li>



                                </ul>
                            </div>
                            <!-- /gn-scroller -->
                        </nav>
                    </li>
                    <!-- //nav_agile_w3l -->
                    <li class="second logo">
                        <h1><a href="AdminPanel.aspx"><i class="fa fa-graduation-cap" aria-hidden="true"></i>Dictionary </a></h1>
                    </li>
                    <li class="second admin-pic">
                        <ul class="top_dp_agile">
                            <li class="dropdown profile_details_drop">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <div class="profile_img">
                                        <span class="prfil-img">
                                            <img id="Proflepic" runat="server" src="images/admin.jpg" alt="">
                                        </span>
                                    </div>
                                </a>
                                <ul class="dropdown-menu drp-mnu">
                                    <li><a href="#profilesettings"><i class="fa fa-cog"></i>Settings</a> </li>


                                    <li><a href="#" runat="server"  onserverclick="logout_ServerClick"><i class="fa fa-sign-out"></i>Logout</a> </li>
                                </ul>
                            </li>

                        </ul>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>

                    <li class="second w3l_search">


                        <asp:TextBox  id="searchtop" runat="server" CssClass="form-control"></asp:TextBox>
                      <asp:AutoCompleteExtender ServiceMethod="SearchWords" MinimumPrefixLength="1" 
   CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="searchtop"  
   ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false" CompletionListCssClass="mylist" >  
      </asp:AutoCompleteExtender>    
                    </li>
                  
                    <li class="second full-screen">
                        <section class="full-top">
                      
                        <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
   </section>
                    </li>

                </ul>
                <!-- //nav -->

            </div>
            <div class="clearfix"></div>
            <!-- //w3_agileits_top_nav-->
            <!-- /inner_content-->
            <div class="inner_content">
                <!-- /inner_content_w3_agile_info-->
                <div class="inner_content_w3_agile_info">
                    <!-- /agile_top_w3_grids-->
                    <div class="agile_top_w3_grids">
                        <ul class="ca-menu">
                            <li>
                                <a href="#">

                                    <i class="fa fa-database" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main" id="Totalwords" runat="server">16,808</h4>
                                        <h3 class="ca-sub">Total Words</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#addwords">
                                    <i class="fa fa-font" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main one"></h4>
                                        <h3 class="ca-sub one">Add Words</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#addwords" >
                                    <i class="fa fa-edit" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main two"></h4>
                                        <h3 class="ca-sub two">Edit Words</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#addwords">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main three"></h4>
                                        <h3 class="ca-sub three">Delete Words</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-clipboard" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main four" id="TodayWords" runat="server">30,808</h4>
                                        <h3 class="ca-sub four">Today's Words</h3>
                                    </div>
                                </a>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </div>

                    <div id="profilesettings" class="graph-form agile_info_shadow">
                        <h3 class="w3_inner_tittle two">Settings </h3>
                     <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                               <ContentTemplate>       <div class="form-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" class="form-control" id="userValue" runat="server" placeholder="User name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="passValue" runat="server" placeholder="Password">
                            </div>
                            <div class="form-group">

                                <p id="Errormsglogin" runat="server"></p>
                            </div>

                            <button type="button" class="btn btn-default" id="AdminLogin" runat="server" onserverclick="AdminLogin_ServerClick">Submit</button>



                        </div>
</ContentTemplate></asp:UpdatePanel>
                    </div>





                    <div id="addwords" class="graph-form agile_info_shadow">
                        <h3 class="w3_inner_tittle two">Words Management </h3>
                     <p>Enter antonym / synonym seperated by commas</p>   <div class="form-body">

                             <div class="form-group">
                             <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                               <ContentTemplate> 
                                       <div class="col-md-4">
                                    <label for="exampleInputEmail1">Word</label>
                             <asp:TextBox ID="Aword"  runat="server" CssClass="form-control" MaxLength="25" AutoPostBack="true" OnTextChanged="Aword_TextChanged"   ></asp:TextBox>      
                                      <asp:AutoCompleteExtender ServiceMethod="SearchWords" MinimumPrefixLength="1" 
   CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="Aword"  
   ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false" CompletionListCssClass="mylist" >  
      </asp:AutoCompleteExtender>      <%-- <input type="text" class="form-control" id="Aword" runat="server" placeholder="Enter word" maxlength="25">--%>
                                </div>
                                
                                  <div class="col-md-4">
                                    <label for="exampleInputEmail1">Antonym</label>
                                    <input type="text" class="form-control" id="Anto" runat="server" placeholder="Enter antonym" maxlength="50">
                                </div>
                                <div class="col-md-4">
                                    <label for="exampleInputPassword1">Synonym</label>
                                    <input type="text" class="form-control" id="Sync" runat="server" placeholder="Enter synonym" maxlength="50">
                                </div> 

                               </ContentTemplate>   </asp:UpdatePanel>
                            </div>
                          
                            <div class="form-group" >
                                 <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                               <ContentTemplate>  <div class="col-md-12">
                                    <label for="exampleInputPassword1">Meaning</label>
                                    <textarea  class="form-control" id="meaningAdd" runat="server" placeholder="Enter meaning" rows="5" maxlength="250">
                                        </textarea>
                                </div>
                                 </ContentTemplate>   </asp:UpdatePanel>
                            </div>
                                

                          <div class="form-group" >
                                 <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                               <ContentTemplate> 
                                      <div class="col-md-4">
                                    <label for="exampleInputPassword1">Adjective</label>
                                    <input type="text" class="form-control" id="adj" runat="server" placeholder="Enter adjective" maxlength="50">
                                </div> 

                                      <div class="col-md-4">
                                    <label for="exampleInputPassword1">Verb</label>
                                    <input type="text" class="form-control" id="verb" runat="server" placeholder="Enter verb" maxlength="50">
                                </div> 

                                      <div class="col-md-4">
                                    <label for="exampleInputPassword1">Abbreviation</label>
                                    <input type="text" class="form-control" id="abbr" runat="server" placeholder="Enter abbreviation" maxlength="50">
                                </div> 
                                 </ContentTemplate>   </asp:UpdatePanel>
                            </div>

                            <div class="form-group">
                               
                           <asp:UpdatePanel runat="server" ID="up1">
                               <ContentTemplate>   <button type="button" style="margin: 20px 0px 0px 15px;" class="btn btn-success" id="addWordButton" runat="server" onserverclick="addWordButton_ServerClick"><i class="fa fa-plus"></i></button>

                                <button type="button" style="margin: 20px 0px 0px 15px;" class="btn btn-warning" id="editButton" runat="server" onserverclick="editButton_ServerClick"><i class="fa fa-pencil"></i></button>

                                <button type="button" style="margin: 20px 0px 0px 15px;" class="btn btn-danger" id="deleteButton" runat="server" onserverclick="deleteButton_ServerClick"><i class="fa fa-trash-o"></i></button>

                              
                            </div>
                            <p id="errormsgAddWord" runat="server"></p> </ContentTemplate>   </asp:UpdatePanel>
                        </div>

                  

                </div>
                <!-- //inner_content_w3_agile_info-->
            </div>
            <!-- //inner_content-->
        </div>
        <!-- banner -->
        <!--copy rights start here-->
        <div class="copyrights">
            <p>© 2017 My Dictionary. All Rights Reserved | Developed by  <a href="http://alkhaliq.tech/" target="_blank">AL-KHALIQ TECH</a> </p>
        </div>
        <!--copy rights end here-->
        <!-- js -->

        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

        <!-- /amcharts -->
        <script src="js/amcharts.js"></script>
        <script src="js/serial.js"></script>
        <script src="js/export.js"></script>
        <script src="js/light.js"></script>
        <!-- Chart code -->
        
        <!-- Chart code -->
     
        <!-- //amcharts -->
        <script src="js/chart1.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/modernizr.custom.js"></script>
<script>
    $(document).ready(function () {
        $('#Aword').keyup(function () {
           document.getElementById('meaningAdd').value='';
        });
    });
</script>
        <script src="js/classie.js"></script>
        <script src="js/gnmenu.js"></script>
        <script>
            new gnMenu(document.getElementById('gn-menu'));
        </script>
        <!-- script-for-menu -->

        <!-- /circle-->
        <script type="text/javascript" src="js/circles.js"></script>
        <script>
            var colors = [
                    ['#ffffff', '#fd9426'], ['#ffffff', '#fc3158'], ['#ffffff', '#53d769'], ['#ffffff', '#147efb']
            ];
            for (var i = 1; i <= 7; i++) {
                var child = document.getElementById('circles-' + i),
                    percentage = 30 + (i * 10);

                Circles.create({
                    id: child.id,
                    percentage: percentage,
                    radius: 80,
                    width: 10,
                    number: percentage / 1,
                    text: '%',
                    colors: colors[i - 1]
                });
            }

        </script>
        <!-- //circle -->
        <!--skycons-icons-->
        <script src="js/skycons.js"></script>
        <script>
            var icons = new Skycons({ "color": "#fcb216" }),
                 list = [
                   "partly-cloudy-day"
                 ],
                 i;

            for (i = list.length; i--;)
                icons.set(list[i], list[i]);
            icons.play();
        </script>
        <script>
            var icons = new Skycons({ "color": "#fff" }),
                 list = [
                   "clear-night", "partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind", "fog"
                 ],
                 i;

            for (i = list.length; i--;)
                icons.set(list[i], list[i]);
            icons.play();
        </script>
        <!--//skycons-icons-->
        <!-- //js -->
        <script src="js/screenfull.js"></script>
        <script>
            $(function () {
                $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

                if (!screenfull.enabled) {
                    return false;
                }



                $('#toggle').click(function () {
                    screenfull.toggle($('#container')[0]);
                });
            });
        </script>
        <script src="js/flipclock.js"></script>

        <script type="text/javascript">
            var clock;

            $(document).ready(function () {

                clock = $('.clock').FlipClock({
                    clockFace: 'HourlyCounter'
                });
            });
        </script>
        <script src="js/bars.js"></script>
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>

        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

    </form>
</body>
</html>
