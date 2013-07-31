<div class="page-header position-relative">
    <h1>
        <img class="nav-user-photo" src="/MiniTwitter/API/users/profile_image?username=${info.username}" height="50" width="40" alt="Jason's Photo" />
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
                    <form target="hiddenIframe" method="post" action="/MiniTwitter/API/statuses/update" id="tweetForm" enctype="multipart/form-data">
                        <div class="form-actions input-append">
                            <input placeholder="Compose a tweet..." name="status" type="text" class="width-75" id="tweet" />
                            <button class="btn btn-info no-radius" onclick="uploadFile(); return false;">
                                <i class="icon-camera"></i>
                            </button>
                            <button class="btn btn-info no-radius">
                                <i class="icon-location-arrow"></i>
                            </button>
                            <button class="btn btn-danger no-radius" onclick="$('#tweetForm').submit(); window.location.reload();">
                                <i class="icon-pencil"></i>
                                <span class="hidden-phone">Tweet</span>
                            </button>
                            <input id="upload" name="files[]" type="file" multiple style="visibility:hidden;"/>
                        </div>
                    </form>
                    <iframe name="hiddenIframe" id="hiddenIframe" style="display:none;"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix">
    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}">
            <span class="grey">Tweets</span>
            <h4 class="bigger pull-right">${num_of_tweets}</h4>
        </a>
    </div>

    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}/followers">
            <span class="grey">Followers</span>
            <h4 class="bigger pull-right">${num_followers}</h4>
        </a>
    </div>

    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}/following">
            <div>
                <span class="grey">Following</span>
                <h4 class="bigger pull-right">${num_following}</h4>
            </div>
        </a>
    </div>

</div>

<script type="text/javascript">
    function uploadFile() {
        var element = document.getElementById("upload");
        element.click();
    }
</script>
