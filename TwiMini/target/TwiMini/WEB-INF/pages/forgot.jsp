<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MiniTwitter - Forgot password</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="../../w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">
            <div class="page-header">

                <div id="page-logo-header" class="deny-underline-in-links">
                    <a href="/MiniTwitter/Website">
                        <h1>
                            <%--<img src="../../w8_admin/bootstrap/img/det_logo2.png" width="10%" />--%>
                            <img src="../../w8_admin/bootstrap/img/det_logo_cropped.jpg" width="4%" />
                            TwiMini
                        </h1>
                    </a>

                </div>

            </div>
            <form class="form-forgot-password" action="/MiniTwitter/Website/forgot" method="post">
                <div id="page-content" class="span">
                    <div>
                        <div class="row">
                            <div class="span10 offset1">
                            <%--<div class="span6 offset3">--%>
                                <form class="form-forgot-pwd">
                                    <div class="page-content-sub-heading pagination-centered">
                                        <h3>Forgot your password? </h3>
                                    </div>
                                    <div class="page-content-sub-content">
                                        <div class="row">
                                            <div class="span6 offset2">
                                            <%--<div class="span6">--%>
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
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!--basic scripts-->



</body>
</html>