function getTweetData(offset,username) {
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
            if(tweet.originalId===null) data.push('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.username+'"/></div>');
            else data.push('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.originalId+'"/></div>');
            data.push('<div class="body"><div class="time"><i class="icon-time"></i>');
            data.push('<span class="green">');
            data.push('<span title="'+tweet.timestamp+'">&nbsp;'+time+'</span');
            data.push('</span>');
            data.push('</div>');
            data.push('<div class="name">');
            if(tweet.originalId===null) data.push('<a href="/MiniTwitter/Website/'+tweet.username+'">'+tweet.username+'</a>');
            else data.push('<a href="/MiniTwitter/Website/'+tweet.originalId+'">'+tweet.originalId+'</a>');
            data.push('</div>');
            if(tweet.originalId===null) data.push('<div class="text">'+urlify(tweet.tweet)+'</div>');
            else data.push('<div class="text">'+urlify(tweet.tweet)+'<div><small class="grey">Retweeted by '+ '<a href="/MiniTwitter/Website/'+tweet.username+'">'+tweet.username+'</a>' +'</small></div></div>');
            data.push('<div class="tools" style="margin-right: 25px">');
            data.push('<table><tr>');
            var url = "https://www.facebook.com/dialog/feed?app_id=140586622674265&link=http%3A%2F%2F172.16.152.62%3A8080%2FMiniTwitter%2FAPI%2Fstatuses%2Fshow%3Fid%3D"+tweet.id+"&name=View+"+tweet.username+"%27s+tweet+on+MiniTwitter&picture=http://3.bp.blogspot.com/-NxouMmz2bOY/T8_ac97cesI/AAAAAAAAGg0/e3vY1_bdnbE/s320/Twitter+logo+2012.png&redirect_uri=http%3A%2F%2Fs7.addthis.com%2Fstatic%2Fpostshare%2Fc00.html"
            data.push('<td><a  target="_blank" onclick="return !window.open(this.href, \'Facebook\', \'width=640,height=300\')" href="'+url+'" class="btn btn-minier btn-info"><i class="icon-only icon-facebook"></i></a></td>');
            if(tweet.username!==username) {
                data.push('<td><a class="btn btn-minier btn-info"><i class="icon-only icon-retweet" onclick="reTweet('+ tweet.id +')"></i></a></td>');
            }
            data.push("</tr></table></div></div></div>");
            var content = data.join("");
            $(content).appendTo(".tweets");
        });
    });
}