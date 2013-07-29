function follow(username,element) {
    $.ajax({
        url: '/MiniTwitter/API/friendships/create?username='+username,
        type: 'POST',
        dataType: "text",
        success:function(data) {
            if(data.length!=0) {
                window.location.replace("/MiniTwitter/Website");
            }
            else {
                console.log("Successfully followed user "+username);
                var $parent = $(element).closest('.switch');
                $parent.replaceWith('<div><a class="switch" href="#"><span class="label label-important" onclick="unfollow(\''+username+'\',this)">Unfollow</span></a></div>');
            }
        }
    });
}

function unfollow(username,element) {
    $.ajax({
        url: '/MiniTwitter/API/friendships/destroy?username='+username,
        type: 'POST',
        success:function(data) {
            if(data.length!=0) {
                window.location.replace("/MiniTwitter/Website");
            }
            console.log("Successfully unfollowed user "+username);
            var $parent = $(element).closest('.switch');
            $parent.replaceWith('<div><a class="switch" href="#"><span class="label label-success" onclick="follow(\''+username+'\',this)">Follow</span></a></div>');
        }
    });
}

function getFollowing(username,currentLoggedUser) {
    console.log("Getting following");
    console.log("Current Logged User : "+currentLoggedUser);
    $.getJSON("/MiniTwitter/API/followers/lists?"+"username="+username, function(htmlContent) {
        var items = [];
        $.each(htmlContent, function(array, relationship) {
            var htmlContent = [];
            htmlContent.push('<div class="itemdiv memberdiv">');
            htmlContent.push('<div class="user">');
            htmlContent.push('<img alt="Bob Doe\'s avatar" src="/MiniTwitter/API/users/profile_image?username='+relationship.username+'"/>');
            htmlContent.push('</div>');
            htmlContent.push('<div class="body"><div class="name">');
            htmlContent.push('<a href="/MiniTwitter/Website/'+relationship.username+'">'+relationship.name+'</a></div>');
            htmlContent.push('<div><small>');
            htmlContent.push(relationship.username);
            htmlContent.push('</small></div>');
            if(currentLoggedUser!=="-1") {
                $.ajax({
                    url: '/MiniTwitter/API/friendships/exists?follower='+currentLoggedUser+'&following='+relationship.username,
                    type: 'GET',
                    htmlContentType: 'text/html',
                    success:function(data)
                    {
                        console.log(data);
                        if(data==="true") {
                            htmlContent.push('<div><a class="switch" href="#"><span class="label label-important" onclick="unfollow(\''+relationship.username+'\',this)">Unfollow</span></a></div>');
                        }
                        else {
                            htmlContent.push('<div><a class="switch" href="#"><span class="label label-success" onclick="follow(\''+relationship.username+'\',this)">Follow</span></a></div>');
                        }
                    },
                    async: false
                });
            }
            else {
                htmlContent.push('<div><a class="switch" href="#"><span class="label label-success" onclick="follow(\''+relationship.username+'\',this)">Follow</span></a></div>');
            }
            htmlContent.push('</div></div>')
            var content = htmlContent.join("");
            console.log(content);
            $(content).appendTo(".followers");
        });
    });
}
