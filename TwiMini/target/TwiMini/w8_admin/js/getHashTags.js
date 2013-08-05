function getHashTags(offset,tagName) {
    $.ajax({
        url:"/MiniTwitter/API/search/hashtags?"+"offset="+offset+"&query="+tagName,
        type: 'GET',
        async: false,
        success: function(data){
            $.each(data, function(array, tweet) {
                console.log(tweet);
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
                if(tweet.originalId===null) {
                    data.push('<div class="text">'+urlify(tweet.tweet)+'</div>');
                    data = addImages(data, tweet.id);
                }
                else {
                    data.push('<div class="text">'+urlify(tweet.tweet)+'<div>');
                    data = addImages(data, tweet.id);
                    data.push('<small class="text grey">Retweeted by '+ '<a href="/MiniTwitter/Website/'+tweet.username+'">'+tweet.username+'</a></small>');
                }
                if(tweet.location!==null) {
                    //data.push('<small class="grey">From '+ '<a href="http://maps.google.com/maps?q=' + tweet.latitude + ',' + tweet.longitude +'">'+tweet.location+'</a>' +'</small>');
                    frameSrc = '<a href="http://maps.google.com/maps?q=' + tweet.latitude + ',' + tweet.longitude;
                    data.push('<small class="grey">From '+ '<a data-toggle="modal" href="#MapModal" id="showmap" onclick="addMap('+tweet.latitude+','+tweet.longitude+')">'+tweet.location+'</a>' +'</small>');
                }
                data.push('<div class="tools" style="margin-right: 25px">');
                data.push('<table><tr>');
                var url = "https://www.facebook.com/dialog/feed?app_id=140586622674265&link=http%3A%2F%2F172.16.152.62%3A8080%2FMiniTwitter%2FAPI%2Fstatuses%2Fshow%3Fid%3D"+tweet.id+"&name=View+"+tweet.username+"%27s+tweet+on+MiniTwitter&picture=http://3.bp.blogspot.com/-NxouMmz2bOY/T8_ac97cesI/AAAAAAAAGg0/e3vY1_bdnbE/s320/Twitter+logo+2012.png&redirect_uri=http%3A%2F%2Fs7.addthis.com%2Fstatic%2Fpostshare%2Fc00.html"
                data.push('<td><a  target="_blank" onclick="return !window.open(this.href, \'Facebook\', \'width=640,height=300\')" href="'+url+'" class="btn btn-minier btn-info"><i class="icon-only icon-facebook"></i></a></td>');
                data.push('<td><a class="btn btn-minier btn-info"><i class="icon-only icon-retweet" onclick="reTweet('+ tweet.id +')"></i></a></td>');
                data.push("</tr></table></div></div></div>");
                var content = data.join("");
                $(content).appendTo("#hash_tweets");
            });
        }
    });
    $('#HashModalTitle').text(tagName);
    function addImages(data,id) {
        data.push('<div class="images">')
        $.ajax({
            url:"/MiniTwitter/API/tweets/getImages?id="+id,
            type: 'GET',
            async: false,
            success: function(result){
                $.each(result, function(key, image) {
                    data.push('<a data-slideshow="5000" onclick="loadImages('+id+')" href="#modal-gallery" data-toggle="modal" data-selector="#gallery [data-gallery=gallery]"><img style="height: 240px" src="data:image/png;base64,'+image+'"></img></a>');
                    data.push('&nbsp;');
                });
            }});
        data.push('</div>');
        return data;
    }
}

function initialize(tagName) {
    console.log("Here");
    $('#hash_tweets').html("");
    var offset = 0;
    getHashTags(offset,tagName);
    $('#hashtagbody').bind('scroll',chk_scroll);
    function chk_scroll(e)
    {
        console.log("Scrolling");
        var elem = $(e.currentTarget);
        if (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
        {
            offset++;
            getHashTags(offset,tagName);
        }
    }
}