<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dictionary.aspx.cs" Inherits="Dictionary.Dictionary" %>


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
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
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
                                    <li><a href="login.aspx"><i class="fa fa-user"></i>Admin</a></li>
                                    <li>
                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i>Search <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                        <ul class="gn-submenu">
                                            <li class="mini_list_agile"><a href="#searchresult"><i class="fa fa-caret-right" aria-hidden="true"></i>Starting With</a></li>
                                            <li class="mini_list_w3"><a href="#searchresult"><i class="fa fa-caret-right" aria-hidden="true"></i>Ending With</a></li>
                                            <li class="mini_list_w3"><a href="#searchresult"><i class="fa fa-caret-right" aria-hidden="true"></i>Anywhere</a></li>
                                        </ul>
                                    </li>


                                   


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
                                    <li><a href="login.aspx"><i class="fa fa-user"></i>Login</a> </li>


                                </ul>
                            </li>

                        </ul>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>

              <li class="second w3l_search">

                    <asp:UpdatePanel runat="server" ID="up2" >
                   <ContentTemplate>
                        <asp:TextBox  id="searchtop" runat="server" CssClass="form-control" OnTextChanged="searchtop_TextChanged" AutoPostBack="true"></asp:TextBox>
                      <asp:AutoCompleteExtender ServiceMethod="SearchWords" MinimumPrefixLength="1" 
   CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="searchtop"  
   ID="AutoCompleteExtender2" runat="server" FirstRowSelected="false" CompletionListCssClass="mylist" >  
      </asp:AutoCompleteExtender> </ContentTemplate>
               </asp:UpdatePanel>     
                    </li>
                  
                    <li class="second full-screen">
                        <section class="full-top">
                       <asp:UpdatePanel runat="server" ID="UpdatePanel1" >
                   <ContentTemplate>
                        <button id="topButton" runat="server" onserverclick="topButton_ServerClick" class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button> </ContentTemplate>
               </asp:UpdatePanel>  
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

					<!-- breadcrumbs -->
						<div class="w3l_agileits_breadcrumbs">
							<div class="w3l_agileits_breadcrumbs_inner">
								<ul>
									<li><a href="Dictionary.aspx">Home</a><span>«</span></li>
									
									<li>Dictionary</li>
								</ul>
							</div>
						</div>
					<!-- //breadcrumbs -->
                  
                    	<div id="searchresults" class="inner_content_w3_agile_info two_in">
					  <h2 class="w3_inner_tittle">Dictionary</h2>
									<!-- tables -->
									
									<div class="agile-tables">
										<div class="w3l-table-info agile_info_shadow">
										 <h3 class="w3_inner_tittle two">Search Results</h3>
									
                                            <asp:UpdatePanel runat="server" ID="up1">
                                                <ContentTemplate>

                                             <asp:TextBox runat="server" ID="Stext" OnTextChanged="Stext_TextChanged" AutoPostBack="true"></asp:TextBox>
								&nbsp;  &nbsp;	<asp:RadioButton runat="server" ID="starting" Text="Starting With" OnCheckedChanged="starting_CheckedChanged" AutoPostBack="true"/>
                                                    &nbsp;  &nbsp;
	<asp:RadioButton runat="server" ID="ending" Text="Ending With" OnCheckedChanged="ending_CheckedChanged" AutoPostBack="true"/>&nbsp;  &nbsp;
	<asp:RadioButton runat="server" ID="exact" Text="Exact Match" OnCheckedChanged="exact_CheckedChanged" AutoPostBack="true"/>&nbsp;  &nbsp;
                                                    	<asp:RadioButton runat="server" ID="anywhere" Text="Anywhere" OnCheckedChanged="anywhere_CheckedChanged" AutoPostBack="true"/>


                                            <asp:Repeater ID="rptTable" runat="server">
    <HeaderTemplate>
        <table class="table">
             <tr>
												<th>Word</th>
												<th colspan="4">Meanings</th>
												<th>Antonym</th>
												<th>Synonym</th>
												<th>Adjective</th>
												<th>Verb</th>
												<th>Abbreviation</th>
												
											  </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td ><%# Eval("word") %></td>
            <td colspan="4"><%# Eval("wmean") %></td>
           <td ><%# Eval("want") %></td>
           <td ><%# Eval("wsync") %></td>
           <td ><%# Eval("adj") %></td>
           <td ><%# Eval("verb") %></td>
           <td ><%# Eval("abbr") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
									  <code class="js">
										
									  </code>

                                                       </ContentTemplate>
                                            </asp:UpdatePanel>
								</div>
							
						</div>
							<!-- //tables -->
					
							<!-- /social_media-->
						  
						<!-- //social_media-->
				    </div>
					<!-- //inner_content_w3_agile_info-->
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
        <script>
            var chart = AmCharts.makeChart("chartdiv", {
                "theme": "light",
                "type": "serial",
                "startDuration": 2,
                "dataProvider": [{
                    "country": "USA",
                    "visits": 4025,
                    "color": "#FF0F00"
                }, {
                    "country": "China",
                    "visits": 1882,
                    "color": "#FF6600"
                }, {
                    "country": "Japan",
                    "visits": 1809,
                    "color": "#FF9E01"
                }, {
                    "country": "Germany",
                    "visits": 1322,
                    "color": "#FCD202"
                }, {
                    "country": "UK",
                    "visits": 1122,
                    "color": "#F8FF01"
                }, {
                    "country": "France",
                    "visits": 1114,
                    "color": "#B0DE09"
                }, {
                    "country": "India",
                    "visits": 984,
                    "color": "#04D215"
                }, {
                    "country": "Spain",
                    "visits": 711,
                    "color": "#0D8ECF"
                }, {
                    "country": "Netherlands",
                    "visits": 665,
                    "color": "#0D52D1"
                }, {
                    "country": "Russia",
                    "visits": 580,
                    "color": "#2A0CD0"
                }, {
                    "country": "South Korea",
                    "visits": 443,
                    "color": "#8A0CCF"
                }, {
                    "country": "Canada",
                    "visits": 441,
                    "color": "#CD0D74"
                }, {
                    "country": "Brazil",
                    "visits": 395,
                    "color": "#754DEB"
                }, {
                    "country": "Italy",
                    "visits": 386,
                    "color": "#DDDDDD"
                }, {
                    "country": "Taiwan",
                    "visits": 338,
                    "color": "#333333"
                }],
                "valueAxes": [{
                    "position": "left",
                    "axisAlpha": 0,
                    "gridAlpha": 0
                }],
                "graphs": [{
                    "balloonText": "[[category]]: <b>[[value]]</b>",
                    "colorField": "color",
                    "fillAlphas": 0.85,
                    "lineAlpha": 0.1,
                    "type": "column",
                    "topRadius": 1,
                    "valueField": "visits"
                }],
                "depth3D": 40,
                "angle": 30,
                "chartCursor": {
                    "categoryBalloonEnabled": false,
                    "cursorAlpha": 0,
                    "zoomable": false
                },
                "categoryField": "country",
                "categoryAxis": {
                    "gridPosition": "start",
                    "axisAlpha": 0,
                    "gridAlpha": 0

                },
                "export": {
                    "enabled": true
                }

            }, 0);
        </script>
        <!-- Chart code -->
        <script>
            var chart = AmCharts.makeChart("chartdiv1", {
                "type": "serial",
                "theme": "light",
                "legend": {
                    "horizontalGap": 10,
                    "maxColumns": 1,
                    "position": "right",
                    "useGraphSettings": true,
                    "markerSize": 10
                },
                "dataProvider": [{
                    "year": 2017,
                    "europe": 2.5,
                    "namerica": 2.5,
                    "asia": 2.1,
                    "lamerica": 0.3,
                    "meast": 0.2,
                    "africa": 0.1
                }, {
                    "year": 2016,
                    "europe": 2.6,
                    "namerica": 2.7,
                    "asia": 2.2,
                    "lamerica": 0.3,
                    "meast": 0.3,
                    "africa": 0.1
                }, {
                    "year": 2015,
                    "europe": 2.8,
                    "namerica": 2.9,
                    "asia": 2.4,
                    "lamerica": 0.3,
                    "meast": 0.3,
                    "africa": 0.1
                }],
                "valueAxes": [{
                    "stackType": "regular",
                    "axisAlpha": 0.5,
                    "gridAlpha": 0
                }],
                "graphs": [{
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "Europe",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "europe"
                }, {
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "North America",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "namerica"
                }, {
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "Asia-Pacific",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "asia"
                }, {
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "Latin America",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "lamerica"
                }, {
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "Middle-East",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "meast"
                }, {
                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                    "fillAlphas": 0.8,
                    "labelText": "[[value]]",
                    "lineAlpha": 0.3,
                    "title": "Africa",
                    "type": "column",
                    "color": "#000000",
                    "valueField": "africa"
                }],
                "rotate": true,
                "categoryField": "year",
                "categoryAxis": {
                    "gridPosition": "start",
                    "axisAlpha": 0,
                    "gridAlpha": 0,
                    "position": "left"
                },
                "export": {
                    "enabled": true
                }
            });
        </script>

        <!-- //amcharts -->
        <script src="js/chart1.js"></script>
        <script src="js/Chart.min.js"></script>
        <script src="js/modernizr.custom.js"></script>

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

