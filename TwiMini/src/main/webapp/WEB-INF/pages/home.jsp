<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="includes/tabImage.jsp" %>

    <meta charset="utf-8" />
    <title>TwiMini</title>
    <meta name="description" content="This is page-header (.page-header &gt; h1)" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--basic styles-->

    <link href="../../w8_admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

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
<script src="../../w8_admin/js/processTweets.js"></script>
<script src="../../w8_admin/js/getTweetData.js"></script>
<script src="../../w8_admin/js/autoComplete.js"></script>
<script src="../../w8_admin/js/retweet.js"></script>
<script src="../../w8_admin/js/getHashTags.js"></script>


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
<script>
    offset = 0;
    $(document).ready(function() {
        init_name = '${currentUser.name}';
        init_description = '${currentUser.description}';
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
        addUsersTofollow(offset);
    });

    function addUsersTofollow(off) {
        $.ajax({
            type:  "GET",
            url: "/MiniTwitter/API/friendships/recommendations?offset="+off,
            success: function(response) {
                var data = [];
                $.each(response, function(array, username) {
                    console.log(username)
                    data.push('<li><a><i class="icon-double-angle-right"></i>');
                    data.push('<img class="nav-user-photo picture-suggested" src="/MiniTwitter/API/users/profile_image?username='+username+'" alt="Jason\'s Photo" />')
                    data.push('<span class="user-suggested" onclick="document.location.href=\'/MiniTwitter/Website/'+username+'\'">'+username+'</span>');
                    data.push('<span><span class="label-suggested switch label label-success pull-right" onclick="follow(\''+username+'\',this)">Follow</span></span>')
                    data.push('</a>');
                    data.push('<li>');
                });
                offset++;
                data.push('<li><a><i class="icon-double-angle-right"></i>');
                data.push('<span class="user-suggested" onclick="addUsersTofollow(offset)">More</span>');
                var content = data.join("");
                $('#suggestions').html(content);
            }
        })
    }

    function follow(username,element) {
        $.ajax({
            url: '/MiniTwitter/API/friendships/create?username='+username,
            type: 'POST',
            dataType: "text",
            success:function(data) {
                if(data.length!=0) {
                    window.location.replace("/MiniTwitter/Website");
                }
                else {
                    console.log("Successfully followed user "+username);
                    var $parent = $(element).closest('.switch');
                    $parent.replaceWith('<span><span class="label-suggested switch label label-important pull-right" onclick="unfollow(\''+username+'\',this)">Unfollow</span></span>');
                }
            }
        });
    }

    function unfollow(username,element) {
        $.ajax({
            url: '/MiniTwitter/API/friendships/destroy?username='+username,
            type: 'POST',
            success:function(data) {
                if(data.length!=0) {
                    window.location.replace("/MiniTwitter/Website");
                }
                console.log("Successfully unfollowed user "+username);
                var $parent = $(element).closest('.switch');
                $parent.replaceWith('<span><span class="label-suggested switch label label-success pull-right" onclick="follow(\''+username+'\',this)">Follow</span></span>');
            }
        });
    }

</script>
<script src="../../w8_admin/js/settingsFormValidation.js"></script>
</body>
</html>