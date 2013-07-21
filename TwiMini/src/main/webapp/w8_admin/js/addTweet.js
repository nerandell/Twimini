/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/21/13
 * Time: 8:50 PM
 * To change this template use File | Settings | File Templates.
 */
function postTweet(){
    var tweet = $('#tweet').val();
    console.log(tweet);
    $.ajax({
        type:  "POST",
        url: "/MiniTwitter/statuses/update",
        data: "status="+tweet,
        success: function(response) {
            $('#tweet').val('');
        }
    })
}

