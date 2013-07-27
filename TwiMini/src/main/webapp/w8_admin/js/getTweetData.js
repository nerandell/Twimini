function getTweetData(offset) {
    $.getJSON("/MiniTwitter/API/statuses/home_timeline?"+"offset="+offset, function(data) {
        var items = [];
        $.each(data, function(array, tweet) {
            var d = new Date(tweet.timestamp);
            var curr_date = d.getDate();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear();
            var hour = d.getHours();
            var minutes = d.getMinutes();
            var time = curr_date + "/" + curr_month + "/" + curr_year + " " + hour + ":" + minutes;
            var data = [];
            data.push('<div class="itemdiv dialogdiv">');
            data.push('<div class="user">');
            data.push('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.username+'"/></div>');
            data.push('<div class="body"><div class="time"><i class="icon-time"></i>');
            data.push('<span class="green">');
            data.push('<span title="'+tweet.timestamp+'">&nbsp;'+time+'</span');
            data.push('</span>');
            data.push('</div>');
            data.push('<div class="name">');
            data.push('<a href="/MiniTwitter/Website/'+tweet.username+'">'+tweet.username+'</a>');
            data.push('</div>');
            data.push('<div class="text">'+urlify(tweet.tweet)+'</div>');
            data.push('<div class="tools">');
            data.push('<a href="#" class="btn btn-minier btn-info"><i class="icon-only icon-share-alt"></i></a>');
            data.push("</div></div></div>");
            var content = data.join("");
            $(content).appendTo(".tweets");
        });
    });
}