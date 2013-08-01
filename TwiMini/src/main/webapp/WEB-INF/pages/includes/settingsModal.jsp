

<!-- sample modal content -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Settings</h4>
            </div>
            <div class="modal-body">

                <div class="profile-pic-div">
                    <img src="../../w8_admin/bootstrap/img/StickFiguesCoffee.png" class="profile-pic" alt="profile picture here">
                </div>
                <div class="modal-form-body">

                    <div>
                        <%--<div class="modal-form-body-side-bar vertical-center">Username</div>--%>
                        <%--<div class="modal-form-body-content-bar">--%>
                        <div class="span2 vertical-center">Username</div>
                        <div class="span4">
                            <input type="text" name="username" class="input-modxlarge signUp-class-inputs" placeholder="Username" value="given value" id="username-box" disabled>
                            <i class="signUp-class-inputs pull-right mid-icon icon-ok" id="username-check"></i>
                        </div>
                    </div>
                    <%--  --%>
                    <div>
                        <div class="span2 vertical-center">Email</div>
                        <div class="span4">
                            <input type="text" name="email" class="input-modxlarge signUp-class-inputs" placeholder="Email address" value="another given value" id="email-box" disabled>
                            <i class="signUp-class-inputs pull-right mid-icon icon-ok" id="email-check"></i>
                        </div>
                    </div>
                    <%--  --%>
                    <div>
                        <div class="span2 vertical-center">Name</div>
                        <div class="span4">
                            <input type="text" name="name" class="input-modxlarge signUp-class-inputs" placeholder="Full name" id="name-box">
                            <i class="signUp-class-inputs pull-right mid-icon" style="display: none;" id="name-check"></i>
                        </div>
                    </div>
                    <%--  --%>
                    <div>
                        <div class="span2 vertical-center">Password</div>
                        <div class="span4">
                            <input type="password" name="password" class="input-modxlarge signUp-class-inputs" placeholder="Password" id="password-box">
                            <i class=" signUp-class-inputs pull-right mid-icon" style="display: none;" id="password-check"></i>
                        </div>
                    </div>
                    <%--  --%>
                    <div>
                        <div class="span2 vertical-center">Describe Yourself</div>
                        <div class="span4">

                        </div>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<li class="green">
    <a data-toggle="modal" href="#myModal">
        <i class="icon-cog"></i>
    </a>
</li>