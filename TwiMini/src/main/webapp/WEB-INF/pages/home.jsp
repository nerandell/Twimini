<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>TwiMini</title>
    <meta name="description" content="This is page-header (.page-header &gt; h1)" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--basic styles-->

    <link href="../../w8_admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../w8_admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../w8_admin/themes/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../w8_admin/themes/css/style.css">
    <link rel="stylesheet" href="../../w8_admin/themes/css/bootstrap-image-gallery.css">

    <!--[if IE 7]>
    <link rel="stylesheet" href="../../w8_admin/themes/font-awesome/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <link rel="stylesheet" href="../../w8_admin/themes/css/prettify.css" />

    <!--fonts-->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!--ace styles-->

    <link rel="stylesheet" href="../../w8_admin/themes/css/w8.min.css" />
    <link rel="stylesheet" href="../../w8_admin/themes/css/w8-responsive.min.css" />
    <link rel="stylesheet" href="../../w8_admin/themes/css/w8-skins.min.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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

    <%@ include file="includes/sidebar.jsp"%>

    <div id="main-content" class="clearfix">

        <%@ include file="includes/searchbar.jsp"%>

        <div id="page-content" class="clearfix">

            <%@include file="includes/userinfo.jsp"%>

            <div class="row-fluid">
                <!--PAGE CONTENT BEGINS HERE-->
                <div class="hr hr-12 hr-dotted"></div>

                <div class="row-fluid">
                    <div class="span12 tweets">
                    </div><!--/span-->
                </div><!--/row-->

                <!--PAGE CONTENT ENDS HERE-->
            </div><!--/row-->
        </div><!--/#page-content-->

        <%@ include file="includes/settings.jsp" %>
    </div><!--/#main-content-->
</div><!--/.fluid-container#main-container-->

<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only bigger-110" position:fixed></i>
</a>

<!--basic scripts-->

<script type="text/javascript">
    window.jQuery || document.write("<script src='themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
</script>
<script src="../../w8_admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../w8_admin/themes/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.ui.touch-punch.min.js"></script>
<script src="../../w8_admin/js/addTweet.js"></script>
<script src="../../w8_admin/js/processTweets.js"></script>
<script src="../../w8_admin/js/getTweetData.js"></script>
<script src="../../w8_admin/js/autoComplete.js"></script>
<script src="../../w8_admin/js/retweet.js"></script>

<script src="../../w8_admin/themes/js/jquery.slimscroll.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.easy-pie-chart.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.sparkline.min.js"></script>

<script src="../../w8_admin/themes/js/jquery.flot.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.flot.pie.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.flot.resize.min.js"></script>

<!--w8 scripts-->

<script src="../../w8_admin/themes/js/w8-elements.min.js"></script>
<script src="../../w8_admin/themes/js/w8.min.js"></script>

<!--inline scripts related to this page-->

<script type="text/javascript">
    var offset = 1;
    var username = '${currentUser.username}';
    var last_id = null;
    $(function() {
        $('.dialogs,.comments').slimScroll({
            height: '300px'
        });
    })

    $(document).ready(function() {
        getTweetData(0,username);
    });

    $(window).scroll(function () {
        if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10) {
            getTweetData(offset,username);
            offset++;
        }
    });
</script>
</body>
</html>