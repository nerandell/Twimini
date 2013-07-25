<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MiniTwitter</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
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
                            <img src="../../w8_admin/bootstrap/img/detective%20silhouette.jpg" alt="Detective pic here" id="Welcome pic" width="65%" height="65%"/>
                        </div>
                        <div class="span5 offset1 ">
                            <%-- pic here --%>
                            <div id="forms" class="pagination-centered">
                                <img src="../../w8_admin/bootstrap/img/det_logo.jpg" alt="logo here" id="Standard logo"/>
                            </div>
                            <div class="subtitle">
                                Stalk and be stalked
                            </div>
                            <form class="form-signing-up" action="/MiniTwitter/Website/signUp" method="post">
                                <div id="register-partial-container">
                                    <div id="register-partial">
                                        <div id="register-name">
                                            <input type="text" class="input-block-level signUp-class-inputs" style="display: none;" name="username" placeholder="Username">
                                            <input type="text" class="input-block-level signUp-class-inputs" style="display: none;" name="name" placeholder="Full name">
                                            <input type="text" class="input-block-level signUp-class-inputs" style="display: none;" name="email" placeholder="Email address">
                                            <input type="password" class="input-block-level signUp-class-inputs" style="display: none;" name="password" placeholder="Password">
                                            <%--<input type="text" class="input-block-level signUp-class-inputs" name="username" placeholder="Username">--%>
                                            <%--<input type="text" class="input-block-level signUp-class-inputs" name="name" placeholder="Full name">--%>
                                            <%--<input type="text" class="input-block-level signUp-class-inputs" name="email" placeholder="Email address">--%>
                                            <%--<input type="password" class="input-block-level signUp-class-inputs" name="password" placeholder="Password">--%>
                                        </div>
                                    </div>
                                    <div id="signUp-button-container" onclick="signUpClicked()">
                                        <div id="signUp-overlay" class="layer-over-overlay">
                                            <button class="btn btn-large btn-block btn-primary" type="submit" value="Sign up">Sign Up</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form class="form-signing-in" action="/MiniTwitter/Website" method="post">
                                <div id="login-partial-container">
                                    <div id="login-partial">
                                        <div id="login-name">
                                            <input type="text" class="input-block-level logIn-class-inputs" style="display: none;" name="username" placeholder="Username">
                                            <input type="password" class="input-block-level logIn-class-inputs" style="display: none;" name="password" placeholder="Password">
                                            <%--<input type="text" class="input-block-level logIn-class-inputs" name="username" placeholder="Username">--%>
                                            <%--<input type="password" class="input-block-level logIn-class-inputs" name="password" placeholder="Password">--%>
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

</body>
</html>