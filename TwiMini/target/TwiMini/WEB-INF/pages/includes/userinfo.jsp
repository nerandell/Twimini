<div class="page-header position-relative">
    <h1>
        <img class="nav-user-photo" src="../../../w8_admin/themes/images/user.png" alt="Jason's Photo" />
        ${info.name}
        <small>
            @${info.username}
        </small>
    </h1>
</div><!--/.page-header-->

<div class="row-fluid">
    <div class="span12">
        <div class="widget-box ">
            <div class="widget-body">
                <div class="widget-main no-padding">
                    <form>
                        <div class="form-actions input-append">
                            <input placeholder="Compose a tweet..." type="text" class="width-75" id="tweet" />
                            <button class="btn btn-small btn-info no-radius" onclick="postTweet()">
                                <i class="icon-pencil"></i>
                                <span class="hidden-phone">Tweet</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="clearfix">
    <div class="grid3">
        <a href="/MiniTwitter/${info.username}">
            <span class="grey">Tweets</span>
            <h4 class="bigger pull-right">${num_of_tweets}</h4>
        </a>
    </div>

    <div class="grid3">
        <a href="/MiniTwitter/${info.username}/followers">
            <span class="grey">Followers</span>
            <h4 class="bigger pull-right">${num_followers}</h4>
        </a>
    </div>

    <div class="grid3">
        <a href="/MiniTwitter/${info.username}/following">
            <div>
                <span class="grey">Following</span>
                <h4 class="bigger pull-right">${num_following}</h4>
            </div>
        </a>
    </div>

</div>
