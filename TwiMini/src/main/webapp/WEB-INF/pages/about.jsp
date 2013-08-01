<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MiniTwitter - About</title>
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
                <%--<div class="page-content-sub-heading pagination-centered"><h3>About</h3></div>--%>
                <div class="row-fluid">
                    <div class="span3">
                        <div class="bs-example bs-example-tabs biggify">
                            <ul id="myTab" class="nav nav-pills nav-stacked">
                                <li class="active"><a href="#about" data-toggle="tab">About MiniTwitter</a></li>
                                <li><a href="#acknowledgement" data-toggle="tab">Acknowledgement</a></li>
                                <li><a href="#team" data-toggle="tab">Team</a></li>
                                <li><a href="#contact" data-toggle="tab">Contact Us</a></li>
                            </ul>

                        </div>
                    </div>
                    <div class="span9">
                        <div class="bs-example bs-example-content">
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="about">
                                    <p>
                                        MiniTwitter - a prototype for the social platform <a href="http://www.Twitter.com">www.Twitter.com</a>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="acknowledgement">
                                    <p>
                                    <h4>Thanks for the help!</h4>
                                    <ul>
                                        <li>DirectI</li>
                                        <li>Nitin Verma</li>
                                        <li>mkyong.com</li>
                                        <li>Stack Overflow</li>
                                        <li>Twitter Bootstrap</li>
                                    </ul>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="team">
                                    <p>
                                        <h4>Developers</h4>
                                        <ul>
                                            <li>Ankit Chandawala</li>
                                            <li>Mayank Dang</li>
                                        </ul>
                                        <%--<div class="span4 offset1">Ankit Chandawala</div>--%>
                                        <%--<div class="span4 offset1">Mayank Dang</div>--%>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="contact">
                                    <%--<h3>Contact us</h3>--%>
                                    <p>
                                        <div class="span4 offset2">
                                            <div>
                                                Ankit Chandawala
                                            </div>
                                            <div>
                                                <a href="https://www.facebook.com/ankit.chandawala"><img src="../../w8_admin/bootstrap/img/icon-facebook-small.png"></img></a>
                                                <a href="mailto:ankit.ch@directi.com"><img src="../../w8_admin/bootstrap/img/Directi-logo.jpg" width="25px"></img></a>
                                                <a href="mailto:ankitchandawala@gmail.com"><img src="../../w8_admin/bootstrap/img/gmail-icon-small.png"></img></a>
                                            </div>
                                        </div>
                                        <div class="span4 offset1">
                                            <div>
                                                Mayank Dang
                                            </div>
                                            <div>
                                                <a href="https://www.facebook.com/mayank.dang"><img src="../../w8_admin/bootstrap/img/icon-facebook-small.png"></img></a>
                                                <a href="mailto:mayank.d@directi.com"><img src="../../w8_admin/bootstrap/img/Directi-logo.jpg" width="25px"></img></a>
                                                <a href="mailto:mayank.dang.42@gmail.com"><img src="../../w8_admin/bootstrap/img/gmail-icon-small.png"></img></a>
                                            </div>
                                        </div>
                                    </p>
                            </div>
                            </div>
                        </div>
                    </div>
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

<%--page-specific scripts--%>
<script src="../../w8_admin/js/pageContentMinHeight.js"></script>
<script src="../../w8_admin/js/dropdownToggle.js"></script>
<script>
    $(document).load(adjustPageContentHeight());
</script>
<script src="../../w8_admin/js/tabsToggle.js"></script>

</body>
</html>