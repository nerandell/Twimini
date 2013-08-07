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
                <li class="grey user-p">
                    <a href="/MiniTwitter/Website/home">
                        <i class="icon-home"></i>
                    </a>
                </li>

                <li class="blue user-p">
                    <a href="#">
                        <i class="icon-search"></i>
                    </a>
                </li>

                <li class="purple">
                    <a href="#">
                        <i class="icon-bell-alt icon-only icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>
                </li>

                <%@ include file="settingsModal.jsp" %>

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
                            <a data-toggle="modal" href="#myModal" onclick="updateInfoInForm();">
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
            </ul><!--/.w8-nav-->
        </div><!--/.container-fluid-->
    </div><!--/.navbar-inner-->
</div>
