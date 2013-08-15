<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="includes/tabImage.jsp" %>
    <meta charset="utf-8">
    <title>MiniTwitter</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div id="notify-wrapper">
        <div class="error-msg-container" style="display: none;">
            <div class="alert-without-cross alert-error error-msg-box" id="message-to-be-displayed">
                error showing
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="page-header-without-line">
                    <%--Space Reserved for header (optional)--%>
                </div>
                <div id="page-content">
                    <div class="top">
                        <div class="span4 offset1">
                        <%-- pic here --%>
                            <img src="../../w8_admin/bootstrap/img/detective%20silhouette.jpg" alt="Detective pic here" id="Welcome pic" style="width: 65%; height: 65%"/>
                        </div>
                        <div class="span5 offset1 ">
                            <%-- pic here --%>
                            <div id="forms" class="pagination-centered">
                                <img src="../../w8_admin/bootstrap/img/det_logo.jpg" alt="logo here" id="Standard logo"/>
                            </div>
                            <div class="subtitle">
                                Stalk and be stalked
                            </div>
                            <form class="form-signing-up" action="/MiniTwitter/Website/signUp" method="post" id="form-signing-up">
                                <div id="register-partial-container">
                                    <div id="register-partial">
                                        <div id="register-name">
                                            <input type="text" name="username" class="input-modxlarge signUp-class-inputs" style="display: none;" placeholder="Username" id="username-box" >
                                            <i class="signUp-class-inputs pull-right mid-icon" style="display: none;" id="username-check"></i>
                                        <%--  --%>
                                            <input type="text" name="name" class="input-modxlarge signUp-class-inputs" style="display: none;" placeholder="Full name" id="name-box">
                                            <i class="signUp-class-inputs pull-right mid-icon" style="display: none;" id="name-check"></i>
                                    <%--  --%>
                                            <input type="text" name="email" class="input-modxlarge signUp-class-inputs" style="display: none;" placeholder="Email address" id="email-box">
                                            <i class="signUp-class-inputs pull-right mid-icon" style="display: none;" id="email-check"></i>
                                        <%--  --%>
                                            <input type="password" name="password" class="input-modxlarge signUp-class-inputs" style="display: none;" placeholder="Password" id="password-box">
                                            <i class=" signUp-class-inputs pull-right mid-icon" style="display: none;" id="password-check"></i>
                                        <%--  --%>
                                        </div>
                                    </div>
                                    <div id="signUp-button-container" onclick="signUpClicked()">
                                        <div id="signUp-overlay" class="layer-over-overlay">
                                            <button class="btn btn-large btn-block btn-primary" type="submit" value="Sign up">Sign Up</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form class="form-signing-in" action="/MiniTwitter/login" method="post">
                                <div id="login-partial-container">
                                    <div id="login-partial">
                                        <div id="login-name">
                                            <input type="text" class="input-block-level logIn-class-inputs" style="display: none;" name="username" placeholder="Username">
                                        <%--  --%>
                                            <input type="password" class="input-block-level logIn-class-inputs" style="display: none;" name="password" placeholder="Password">
                                        <%--  --%>
                                            <label class="checkbox logIn-class-inputs" style="display: none;" >
                                                <input type="checkbox" value="remember-me"> Remember me
                                            </label>
                                        </div>
                                    </div>
                                    <div id="logIn-button-container" onclick="logInClicked()">
                                        <div id="logIn-overlay" class="layer-over-overlay">
                                            <button class="btn btn-large btn-block" type="submit" value="Sign in">Sign In</button>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <%--<a href="/forgot" id="forgot-link" class="logIn-class-inputs little-margin-top-bottom" style="display: none;" > Forgot your password?</a>--%>
                                        <a href="/MiniTwitter/Website/forgot" id="forgot-link" class="logIn-class-inputs" style="display: none;" > Forgot your password?</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
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


    <!--page-specific scripts-->
    <script src="../../w8_admin/js/loginPageScript.js"></script>
    <script>
        function adjustPageContentHeight(){
            $('#page-content').css("min-height",($(window).height() - 100));
        }
        $(document).load(adjustPageContentHeight());
    </script>
    <script src="../../w8_admin/js/signUpFormValidation.js"></script>

</body>
</html>