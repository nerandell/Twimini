<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="includes/tabImage.jsp" %>
    <meta charset="utf-8" />
    <title>TwiMini</title>
    <meta name="description" content="This is page-header (.page-header &gt; h1)" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--basic styles-->

    <link href="../../../w8_admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../../w8_admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../../w8_admin/themes/font-awesome/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="../../../w8_admin/themes/font-awesome/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <link rel="stylesheet" href="../../../w8_admin/themes/css/prettify.css" />

    <!--fonts-->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!--ace styles-->

    <link rel="stylesheet" href="../../../w8_admin/themes/css/w8.min.css" />
    <link rel="stylesheet" href="../../../w8_admin/themes/css/w8-responsive.min.css" />
    <link rel="stylesheet" href="../../../w8_admin/themes/css/w8-skins.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="themes/css/ace-ie.min.css" />
    <![endif]-->
    <!--inline styles if any-->
</head>

<body>
<%@ include file="includes/navbar.jsp" %>
<div class="container-fluid" id="main-container">
    <a id="menu-toggler" href="#">
        <span></span>
    </a>

    <%@ include file="includes/sidebar.jsp" %>

    <div id="main-content" class="clearfix">

        <%@ include file="includes/searchbar.jsp" %>

        <div id="page-content" class="clearfix">

            <%@ include file="includes/userinfo.jsp" %>

            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="hr hr-12 hr-dotted"></div>

                <div class="row-fluid">
                    <div class="span12">
                        <div class="widget-box transparent" id="recent-box">
                            <div class="widget-body">
                                <div class="widget-main padding-4">
                                    <div id="member-tab" class="tab-pane">
                                        <div class="clearfix friendship">
                                        </div>
                                    </div><!--member-tab-->
                                </div><!--/widget-main-->
                            </div><!--/widget-body-->
                        </div><!--/widget-box-->
                    </div><!--/span-->
                </div>
                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->
        <%@ include file="includes/settings.jsp" %>
    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->

<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<!--basic scripts-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
</script>
<script src="../../../w8_admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery.ui.touch-punch.min.js"></script>
<script src="../../../w8_admin/js/addTweet.js"></script>
<script src="../../../w8_admin/js/addFriendshipData.js"></script>
<script src="../../../w8_admin/js/getHashTags.js"></script>
<script src="../../../w8_admin/js/getTweetData.js"></script>
<script src="../../../w8_admin/js/processTweets.js"></script>

<script src="../../../w8_admin/themes/js/jquery.slimscroll.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery.easy-pie-chart.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery.sparkline.min.js"></script>

<script src="../../../w8_admin/themes/js/jquery.flot.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery.flot.pie.min.js"></script>
<script src="../../../w8_admin/themes/js/jquery.flot.resize.min.js"></script>

<!--w8 scripts-->

<script src="../../../w8_admin/themes/js/w8-elements.min.js"></script>
<script src="../../../w8_admin/themes/js/w8.min.js"></script>

<!--inline scripts related to this page-->

<script type="text/javascript">
    var username = "${info.username}";
    var currentLoggedUser = "${currentLoggedUser}";
    getFollowing(username,currentLoggedUser)
</script>
<script>
    $(document).ready(function() {
        init_name = '${currentUser.name}';
        init_description = '${currentUser.description}';
        console.log("Adding trends")
        $.ajax({
            type:  "GET",
            url: "/MiniTwitter/API/statuses/trends",
            success: function(response) {
                var data = [];
                $.each(response, function(array, trend) {
                    console.log(trend)
                    data.push('<li><a data-toggle="modal" href="#HashTagModal" id="showHashTags" onclick="initialize('+'\''+trend +'\''+')"><i class="icon-double-angle-right"></i>');
                    data.push("#");
                    data.push(trend);
                    data.push('</a>');
                    data.push('<li>');
                });
                var content = data.join("");
                $(content).appendTo("#trends");
            }
        })
    });
</script>
<script src="../../w8_admin/js/settingsFormValidation.js"></script>
</body>
</html>
