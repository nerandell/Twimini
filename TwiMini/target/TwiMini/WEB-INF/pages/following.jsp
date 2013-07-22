<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
