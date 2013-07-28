function reTweet(id){
    $.ajax({
        type:  "POST",
        url: "/MiniTwitter/API/statuses/retweet?id="+id,
        success: function(response) {
            console.log("Retweeted successfully");
        }
    })
}
