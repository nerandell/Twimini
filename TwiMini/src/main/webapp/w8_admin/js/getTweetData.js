function loadImages(id) {
    console.log("Loading images")
    $('#gallery').html("");
    $.ajax({
        url:"/MiniTwitter/API/tweets/getImages?id="+id,
        type: 'GET',
        async: false,
        success: function(result){
            $.each(result, function(key, image) {
                var gallery = $('#gallery');
                console.log(gallery);
                $('<a data-gallery="gallery" href="data:image/png;base64,'+image+'" title=""/>')
                    .append($('<img>').prop('src', 'data:image/png;base64,'+image))
                    .appendTo(gallery);
            });
        }});
}

function poll(timestamp){
    $.get('/MiniTwitter/API/statuses/polling?id='+timestamp,
        function(data) {
            $("#notifications").text(data);
            if(data>0) {
                $('#notification-message').show();
                if(data===1)
                    $("#notification-number").text(data+ " new tweet");
                else $("#notification-number").text(data+ " new tweets");
            }
            setTimeout(function() {
                poll(timestamp);
            }, 5000);
        });
}

function timeDifference(current, previous) {

    var msPerMinute = 60 * 1000;
    var msPerHour = msPerMinute * 60;
    var msPerDay = msPerHour * 24;
    var msPerMonth = msPerDay * 30;
    var msPerYear = msPerDay * 365;

    var elapsed = current - previous;

    if (elapsed < msPerMinute) {
        return Math.round(elapsed/1000) + ' seconds ago';
    }

    else if (elapsed < msPerHour) {
        return Math.round(elapsed/msPerMinute) + ' minutes ago';
    }

    else if (elapsed < msPerDay ) {
        return Math.round(elapsed/msPerHour ) + ' hours ago';
    }

    else if (elapsed < msPerMonth) {
        return Math.round(elapsed/msPerDay) + ' days ago';
    }

    else if (elapsed < msPerYear) {
        return Math.round(elapsed/msPerMonth) + ' months ago';
    }

    else {
        return Math.round(elapsed/msPerYear ) + ' years ago';
    }
}

function addMap(latitude,longitude) {
    var map_canvas = document.getElementById('map_canvas');
    var myLatlng = new google.maps.LatLng(latitude,longitude);
    var map_options = {
        center: new google.maps.LatLng(latitude, longitude),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(map_canvas, map_options);

    window.setTimeout(function(){
        console.log(myLatlng);
        google.maps.event.trigger(map, 'resize');
        map.setCenter(myLatlng);
        marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            draggable: true
        });
        google.maps.event.addListener(marker, 'click', function() {
            map.setCenter(myLatlng);
        });
    }, 1000);
}

function getTweetData(offset,username) {

    $.getJSON("/MiniTwitter/API/statuses/home_timeline?"+"offset="+offset, function(data) {
        console.log(data);
        var check = 0;
        $.each(data, function(array, tweet) {
            if(offset==0 && check==0) {
                poll(tweet.timestamp);
                check = 1;
            }
            var post_time = new Date(tweet.timestamp);
            var data = [];
            data.push('<div class="itemdiv dialogdiv">');
            data.push('<div class="user">');
            if(tweet.originalId===null) data.push('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.username+'"/></div>');
            else data.push('<img alt="Alexa\'s Avatar" src="/MiniTwitter/API/users/profile_image?username='+tweet.originalId+'"/></div>');
            data.push('<div class="body"><div class="time"><i class="icon-time"></i>');
            data.push('<span class="green">');
            var now = new Date().getTime();
            data.push('<span title="'+tweet.timestamp+'">&nbsp;'+timeDifference(now, post_time)+'</span');
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
            if(tweet.username!==username) {
                data.push('<td><a class="btn btn-minier btn-info"><i class="icon-only icon-retweet" onclick="reTweet('+ tweet.id +')"></i></a></td>');
            }
            data.push("</tr></table></div></div></div>");
            var content = data.join("");
            $(content).appendTo(".tweets");
        });
    });

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




