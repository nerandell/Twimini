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
        <div class="page-header-without-line">
            <%--Space Reserved for header (optional)--%>
        </div>
        <div id="page-content">
            <div class="top">
                <div class="row">
                    <div class="span4 offset1">
                    <%-- pic here --%>
                        <img src="../../w8_admin/bootstrap/img/detective%20silhouette.jpg" alt="Detective pic here" id="Welcome pic" width="65%" height="65%"/>
                    </div>
                    <div class="span6 offset 1">
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
                                        <%--<input type="text" class="input-block-level " style="display: none;" name="username" placeholder="Username">--%>
                                        <%--<input type="text" class="input-block-level" style="display: none;" name="name" placeholder="Full name">--%>
                                        <%--<input type="text" class="input-block-level" style="display: none;" name="email" placeholder="Email address">--%>
                                        <%--<input type="password" class="input-block-level" style="display: none;" name="password" placeholder="Password">--%>
                                        <input type="text" class="input-block-level " name="username" placeholder="Username">
                                        <input type="text" class="input-block-level" name="name" placeholder="Full name">
                                        <input type="text" class="input-block-level" name="email" placeholder="Email address">
                                        <input type="password" class="input-block-level" name="password" placeholder="Password">
                                    </div>
                                </div>
                                <button class="btn btn-large btn-block btn-primary" type="submit" value="Sign up">Sign Up</button>
                            </div>
                        </form>
                            <form class="form-signing-in" action="/MiniTwitter/Website" method="post">
                                <div id="login-partial-container">
                                    <div id="login-partial">
                                        <div id="login-name">
                                            <%--<input type="text" class="input-block-level" style="display: none;" name="username" placeholder="Username">--%>
                                            <%--<input type="password" class="input-block-level" style="display: none;" name="password" placeholder="Password">--%>
                                            <input type="text" class="input-block-level" name="username" placeholder="Username">
                                            <input type="password" class="input-block-level" name="password" placeholder="Password">
                                            <label class="checkbox" style="display: none;" >
                                                <input type="checkbox" value="remember-me"> Remember me
                                            </label>
                                        </div>
                                    </div>
                                    <button class="btn btn-large btn-block" type="submit" value="Sign in">Sign In</button>
                                    <a href="/forgot" id="forgot-link" style="display: none;" > Forgot your password?</a>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>