function urlify(text) {
    var urlRegex = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
    return text.replace(urlRegex, function(url) {
        var youtubeUrl = url.match(/watch\?v=([a-zA-Z0-9\-_]+)/);
        var vimeoUrl = url.match(/^http:\/\/(www\.)?vimeo\.com\/(clip\:)?(\d+).*$/);
        if( youtubeUrl ){
            return '<div></div><iframe src="http://www.youtube.com/embed/'+youtubeUrl[1]+'?rel=0" height="240" width="320" allowfullscreen="" frameborder="0"></iframe></div>'
        }
        else if(url.substring(0,3)=="www")
            return '<a href="http://' + url + '">' + url + '</a>';
        else return '<a href="' + url + '">' + url + '</a>';
    })
}
