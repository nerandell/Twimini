<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Dashboard - W8 Admin</title>
    <meta name="description" content="This is page-header (.page-header &gt; h1)" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--basic styles-->

    <link href="../../w8_admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../w8_admin/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../w8_admin/themes/font-awesome/css/font-awesome.min.css" />

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

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="themes/css/ace-ie.min.css" />
    <![endif]-->
    <!--inline styles if any-->
</head>

<body>
<div class="navbar navbar-inverse">
<div class="navbar-inner">
<div class="container-fluid">
<a href="#" class="brand">
    <small>
        <i class="icon-unlock-alt"></i>
        TwiMini
    </small>
</a><!--/.brand-->

<ul class="nav ace-nav pull-right">
<li class="grey">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-tasks"></i>
        <span class="badge badge-grey">4</span>
    </a>

    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
        <li class="nav-header">
            <i class="icon-ok"></i>
            4 Tasks to complete
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">Software Update</span>
                    <span class="pull-right">65%</span>
                </div>

                <div class="progress progress-mini ">
                    <div style="width:65%" class="bar"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">Hardware Upgrade</span>
                    <span class="pull-right">35%</span>
                </div>

                <div class="progress progress-mini progress-danger">
                    <div style="width:35%" class="bar"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">Unit Testing</span>
                    <span class="pull-right">15%</span>
                </div>

                <div class="progress progress-mini progress-warning">
                    <div style="width:15%" class="bar"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
                    <span class="pull-left">Bug Fixes</span>
                    <span class="pull-right">90%</span>
                </div>

                <div class="progress progress-mini progress-success progress-striped active">
                    <div style="width:90%" class="bar"></div>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                See tasks with details
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="purple">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-bell-alt icon-only icon-animated-bell"></i>
        <span class="badge badge-important">8</span>
    </a>

    <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
        <li class="nav-header">
            <i class="icon-warning-sign"></i>
            8 Notifications
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-pink icon-comment"></i>
												New Comments
											</span>
                    <span class="pull-right badge badge-info">+12</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <i class="btn btn-mini btn-primary icon-user"></i>
                Bob just signed up as an editor ...
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-success icon-shopping-cart"></i>
												New Orders
											</span>
                    <span class="pull-right badge badge-success">+8</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-info icon-twitter"></i>
												Followers
											</span>
                    <span class="pull-right badge badge-info">+11</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#">
                See all notifications
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="green">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="icon-envelope-alt icon-only icon-animated-vertical"></i>
        <span class="badge badge-success">5</span>
    </a>

    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
        <li class="nav-header">
            <i class="icon-envelope"></i>
            5 Messages
        </li>

        <li>
            <a href="#">
                <img src="../../w8_admin/themes/images/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>a moment ago</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="#">
                <img src="../../w8_admin/themes/images/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="#">
                <img src="../../w8_admin/themes/images/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>3:15 pm</span>
											</span>
										</span>
            </a>
        </li>

        <li>
            <a href="#">
                See all messages
                <i class="icon-arrow-right"></i>
            </a>
        </li>
    </ul>
</li>

<li class="light-blue user-profile">
    <a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
        <img class="nav-user-photo" src="../../w8_admin/themes/images/user.png" alt="Jason's Photo" />
								<span id="user_info">
									<small>Welcome,</small>
									Jason
								</span>

        <i class="icon-caret-down"></i>
    </a>

    <ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
        <li>
            <a href="#">
                <i class="icon-cog"></i>
                Settings
            </a>
        </li>

        <li>
            <a href="#">
                <i class="icon-user"></i>
                Profile
            </a>
        </li>

        <li class="divider"></li>

        <li>
            <a href="#">
                <i class="icon-off"></i>
                Logout
            </a>
        </li>
    </ul>
</li>
</ul><!--/.w8-nav-->
</div><!--/.container-fluid-->
</div><!--/.navbar-inner-->
</div>

<div class="container-fluid" id="main-container">
<a id="menu-toggler" href="#">
    <span></span>
</a>

<div id="sidebar">
    <div id="sidebar-shortcuts">
        <div id="sidebar-shortcuts-large">
            <button class="btn btn-small btn-success">
                <i class="icon-home"></i>
            </button>

            <button class="btn btn-small btn-info">
                <i class="icon-pencil"></i>
            </button>

            <button class="btn btn-small btn-warning">
                <i class="icon-group"></i>
            </button>

            <button class="btn btn-small btn-danger">
                <i class="icon-cogs"></i>
            </button>
        </div>

        <div id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!--#sidebar-shortcuts-->

    <ul class="nav nav-list">
        <li class="active">
            <a href="/MiniTwitter/${info.username}/following">
                <i class="icon-dashboard"></i>
                <span>Following</span>
            </a>
        </li>

        <li>
            <a href="/MiniTwitter/${info.username}/followers">
                <i class="icon-text-width"></i>
                <span>Followers</span>
            </a>
        </li>

        <li>
            <a href="/MiniTwitter/${info.username}">
                <i class="icon-list"></i>
                <span>Tweets</span>
            </a>
        </li>

    </ul><!--/.nav-list-->

    <div id="sidebar-collapse">
        <i class="icon-double-angle-left"></i>
    </div>
</div>

<div id="main-content" class="clearfix">
    <div id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="icon-home"></i>
                <a href="#">Home</a>

							<span class="divider">
								<i class="icon-angle-right"></i>
							</span>
            </li>
            <li class="active">Dashboard</li>
        </ul><!--.breadcrumb-->

        <div id="nav-search">
            <form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small search-query" id="nav-search-input" autocomplete="off" />
								<i class="icon-search" id="nav-search-icon"></i>
							</span>
            </form>
        </div><!--#nav-search-->
    </div>

    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                <img class="nav-user-photo" src="../../w8_admin/themes/images/user.png" alt="Jason's Photo" />
                ${info.name}
                <small>
                    @${info.username}
                </small>
            </h1>
        </div><!--/.page-header-->

        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box ">
                    <div class="widget-body">
                        <div class="widget-main no-padding">
                            <form>
                                <div class="form-actions input-append">
                                    <input placeholder="Compose a tweet..." type="text" class="width-75" id="tweet" />
                                    <button class="btn btn-small btn-info no-radius" onclick="postTweet()">
                                        <i class="icon-pencil"></i>
                                        <span class="hidden-phone">Tweet</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix">
            <div class="grid3">
                <a href="/MiniTwitter/${info.username}">
                    <span class="grey">Tweets</span>
                    <h4 class="bigger pull-right">${num_of_tweets}</h4>
                </a>
            </div>

            <div class="grid3">
                <a href="/MiniTwitter/${info.username}/followers">
                    <span class="grey">Followers</span>
                    <h4 class="bigger pull-right">${num_followers}</h4>
                </a>
            </div>

            <div class="grid3">
                <a href="/MiniTwitter/${info.username}/following">
                    <div>
                        <span class="grey">Following</span>
                        <h4 class="bigger pull-right">${num_following}</h4>
                    </div>
                </a>
            </div>
        </div>


        <div class="row-fluid">
            <!--PAGE CONTENT BEGINS HERE-->
            <div class="hr hr-12 hr-dotted"></div>

            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box transparent" id="recent-box">
                        <div class="widget-body">
                            <div class="widget-main padding-4">
                                <div id="member-tab" class="tab-pane">
                                    <div class="clearfix">
                                        <c:forEach items="${following}" var="user">
                                            <div class="itemdiv memberdiv">
                                                <div class="user">
                                                    <img alt="Bob Doe's avatar" src="../../w8_admin/themes/images/user.png" />
                                                </div>

                                                <div class="body">
                                                    <div class="name">
                                                        <a href="/MiniTwitter/${user.username}">
                                                            <c:out value="${user.name}"></c:out>
                                                        </a>
                                                    </div>
                                                    <div>
                                                        <small>
                                                            @<c:out value="${user.username}"></c:out>
                                                        </small>
                                                        </small>
                                                    </div>

                                                    <div>
                                                        <span class="label label-success">Follow</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
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

    <div id="ace-settings-container">
        <div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
            <i class="icon-cog"></i>
        </div>

        <div id="ace-settings-box">
            <div>
                <div class="pull-left">
                    <select id="skin-colorpicker" class="hidden">
                        <option data-class="default" value="#438EB9">#438EB9</option>
                        <option data-class="skin-1" value="#222A2D">#222A2D</option>
                        <option data-class="skin-2" value="#C6487E">#C6487E</option>
                        <option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
                    </select>
                </div>
                <span>&nbsp; Choose Skin</span>
            </div>

            <div>
                <input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
                <label class="lbl" for="ace-settings-header"> Fixed Header</label>
            </div>

            <div>
                <input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
            </div>
        </div>
    </div><!--/#ace-settings-container-->
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
<script src="../../w8_admin/bootstrap/js/bootstrap.min.js"></script>
<script src="../../w8_admin/themes/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../../w8_admin/themes/js/jquery.ui.touch-punch.min.js"></script>

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
    $(function() {

        $('.dialogs,.comments').slimScroll({
            height: '300px'
        });

        $('#tasks').sortable();
        $('#tasks').disableSelection();
        $('#tasks input:checkbox').removeAttr('checked').on('click', function(){
            if(this.checked) $(this).closest('li').addClass('selected');
            else $(this).closest('li').removeClass('selected');
        });

        var oldie = $.browser.msie && $.browser.version < 9;

        var $tooltip = $("<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>").appendTo('body');
        placeholder.data('tooltip', $tooltip);
        var previousPoint = null;

        $('#recent-box [data-rel="tooltip"]').tooltip({plw8ment: tooltip_plw8ment});
        function tooltip_plw8ment(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })
</script>
</body>
</html>
