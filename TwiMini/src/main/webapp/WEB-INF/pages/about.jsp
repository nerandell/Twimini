<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MiniTwitter - Password Reset</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
<div id="notify-wrapper">
</div>
<div class="container" id="main-page-container">
    <div class="row">
        <div class="span12">

            <%@ include file="includes/simpleLogoHeaderWithSignUpDropdown.jsp"%>

            <div id="page-content">

                <ul class="tabs" data-tabs="tabs" data-toggle="tab">
                    <li class="active"><a href="#home">Home</a></li>
                    <li><a href="#profile">Profile</a></li>
                    <li><a href="#messages">Messages</a></li>
                    <li><a href="#settings">Settings</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">...</div>
                    <div class="tab-pane" id="profile">....</div>
                    <div class="tab-pane" id="messages">.....</div>
                    <div class="tab-pane" id="settings">......</div>
                </div>



            </div>

        </div>
    </div>
</div>

<!--basic scripts-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
</script>
<script src="../../w8_admin/bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.1.js"></script>

<%--page-specific scripts--%>
<script src="../../w8_admin/js/pageContentMinHeight.js"></script>
<script src="../../w8_admin/js/dropdownToggle.js"></script>
<script>
    $(document).load(adjustPageContentHeight());
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    })
</script>
<script>
//                        $(function () {
    $('.tabs').tabs();
//                        })
</script>

</body>
</html>