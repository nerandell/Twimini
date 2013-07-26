function getTweetData(offset) {
    $.getJSON("/MiniTwitter/API/statuses/home_timeline?"+"offset="+offset, function(data) {
        console.log("Into ajax call")
        var items = [];
        console.log(data);
        $.each(data, function(array, tweet) {
            var d = new Date(tweet.timestamp);
            var curr_date = d.getDate();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear();
            var hour = d.getHours();
            var minutes = d.getMinutes();
            var time = curr_date + "/" + curr_month + "/" + curr_year + " " + hour + ":" + minutes;
            var data = '<div class="itemdiv dialogdiv">';
            data += ('<div class="user">');
            data += ('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.username+'"/></div>');
            data += ('<div class="body"><div class="time"><i class="icon-time"></i>');
            data += ('<span class="green">');
            data += ('<span title="'+tweet.timestamp+'">&nbsp;'+time+'</span');
            data += ('</span>');
            data += ('</div>');
            data += ('<div class="name">');
            data += ('<a href="/MiniTwitter/Website/'+tweet.username+'">'+tweet.username+'</a>');
            data += ('</div>');
            data += ('<div class="text">'+tweet.tweet+'</div>');
            data += ('<div class="tools">');
            data += ('<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>');
            data += ("</div></div></div>");
            $(data).appendTo(".tweets")
        });
    });
}