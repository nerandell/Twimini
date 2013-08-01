<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MiniTwitter - Forgot password</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div id="notify-wrapper">
        <c:if test="${shouldIDisplayMessage==true}">
            <div class="error-msg-container">
                <div class="alert-without-cross alert-error error-msg-box">
                    ${messageOnTop}
                </div>
            </div>
        </c:if>
    </div>
    <div class="container" id="main-page-container">
        <div class="row">
            <div class="span12">

                <%@ include file="includes/simpleLogoHeader.jsp"%>

                <div id="page-content">
                    <form class="form-forgot-pwd span6 offset3" action="/MiniTwitter/Website/forgot" method="post">
                        <div class="page-content-sub-heading pagination-centered">
                            <h3>Forgot your password? </h3>
                        </div>
                        <div class="page-content-sub-content">
                            <div class="biggify text-center little-margin-top-bottom">
                                Enter your email address to reset your password
                            </div>
                            <div id="input-forgot-partial-container">
                                <div id="input-forgot-partial">
                                    <div id="forgot-p">
                                        <input type="text" class="input-block-level forgot-class-inputs" name="email" placeholder="Email">
                                    </div>
                                </div>
                            </div>
                            <div id="forgot-button-container">
                                <div id="forgot-overlay" class="pagination-centered">
                                    <button class="btn btn-primary" type="submit" value="ForgotPassword">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <%@ include file="includes/simpleFooter.jsp"%>

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
    <script>
        $(document).load(adjustPageContentHeight());
        setTimeout(function(){
            $(".error-msg-container").css("display", "none");
        }, 5000);
    </script>

</body>
</html>