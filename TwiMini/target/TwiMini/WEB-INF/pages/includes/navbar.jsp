<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
                <c:choose>
                    <c:when test="${(empty currentLoggedUser) or (currentLoggedUser eq \"-1\")}">
                    </c:when>
                    <c:otherwise>
                        <li class="grey user-p">
                            <a href="/MiniTwitter/Website">
                                <i class="icon-home"></i>
                            </a>
                        </li>

                        <li class="blue user-p">
                            <a href="#">
                                <i class="icon-search"></i>
                            </a>
                        </li>

                        <li class="purple">
                            <a class="notify" data-time="" onclick="addRecentTweets(this);">
                                <i class="icon-bell-alt icon-only icon-animated-bell"></i>
                                <span id="notifications" class="badge badge-important">0</span>
                            </a>
                        </li>
                        <%@ include file="settingsModal.jsp" %>
                    </c:otherwise>
                </c:choose>

                <%@ include file="MapModal.jsp" %>
                <%@ include file="HashTagModal.jsp" %>
                <c:choose>
                    <c:when test="${(empty currentLoggedUser) or (currentLoggedUser eq \"-1\")}">
                        <li class="light-blue user-profile">
                            <div class="dropdown pull-right user-menu" data-dropdown="dropdown" >
                                <a data-toggle="dropdown" href="#">
								<span id="sign_in_form">
									Sign In
                                    <i class="icon-caret-down"></i>
								</span>
                                </a>
                                <div class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer span3">
                                    <form class="form-signing-in-top" action="/MiniTwitter/login" method="post">
                                        <div id="login-header-right-form">
                                            <div>
                                                <input type="text" class="input-block-level input-large logIn-class-inputs" name="username" placeholder="Username">
                                            </div>
                                            <div>
                                                <input type="password" class="input-block-level input-large logIn-class-inputs" name="password" placeholder="Password">
                                            </div>
                                            <div class="row-fluid">
                                                <div class="span7">
                                                    <label class="inline">
                                                        <input type="checkbox" />
                                                        <span class="lbl"> Remember me</span>
                                                    </label>
                                                </div>
                                                <div class="span5">
                                                    <button class=" pull-right btn btn-primary btn-small" type="submit" value="Sign in">Sign In</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="form-signing-in-top">
                                        <div class="form-signing-in-top">
                                            <a href="/MiniTwitter/Website/forgot">Forgot your password?</a>
                                        </div>
                                        <button class="btn btn-block btn-small" value="Sign up" onclick="goToHomePage()">Sign Up</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="light-blue user-profile">
                            <a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
                                <img class="nav-user-photo" src="/MiniTwitter/API/users/profile_image?username=${currentUser.username}" alt="Profile Photo" />
								<span id="user_info">
									<small>Welcome,</small>
									${currentUser.name}
								</span>

                                <i class="icon-caret-down"></i>
                            </a>

                            <ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
                                <li>
                                    <a data-toggle="modal" href="#myModal">
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
                                    <a href="/MiniTwitter/Website/logout">
                                        <i class="icon-off"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul><!--/.w8-nav-->
        </div><!--/.container-fluid-->
    </div><!--/.navbar-inner-->
</div>