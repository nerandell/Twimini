/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/21/13
 * Time: 8:50 PM
 * To change this template use File | Settings | File Templates.
 */
function postTweet(){
    var tweet = $('#tweet').val();
    console.log("The tweet data is:"+tweet);
    $.ajax({
        type:  "POST",
        url: "/MiniTwitter/API/statuses/update",
        data: "status="+tweet,
        success: function(response) {
            $('#tweet').val('');
        }
    })
}

