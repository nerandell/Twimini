function urlify(text) {
    console.log('Urlifying '+text);
    var re = [
        "\\b((?:https?|ftp)://[^\\s\"'<>]+)\\b",
        "\\b(www\\.[^\\s\"'<>]+)\\b",
        "\\b(\\w[\\w.+-]*@[\\w.-]+\\.[a-z]{2,6})\\b",
        "#([a-z0-9]+)"];
    re = new RegExp(re.join('|'), "gi");
    return text.replace(re, function(match, url, www, mail, twitler){
        if(url) {
            var youtubeUrl = url.match(/watch\?v=([a-zA-Z0-9\-_]+)/);
            var vimeoUrl = url.match(/^http:\/\/(www\.)?vimeo\.com\/(clip\:)?(\d+).*$/);
            if( youtubeUrl ){
                return '<div></div><iframe src="http://www.youtube.com/embed/'+youtubeUrl[1]+'?rel=0" height="240" width="320" allowfullscreen="" frameborder="0"></iframe></div>'
            }
            else if(url.substring(0,3)=="www")
                return '<a href="http://' + url + '">' + url + '</a>';
            else return '<a href="' + url + '">' + url + '</a>';
        }
        if(www) {
            var youtubeUrl = www.match(/watch\?v=([a-zA-Z0-9\-_]+)/);
            var vimeoUrl = www.match(/^http:\/\/(www\.)?vimeo\.com\/(clip\:)?(\d+).*$/);
            if( youtubeUrl ){
                return '<div></div><iframe src="http://www.youtube.com/embed/'+youtubeUrl[1]+'?rel=0" height="240" width="320" allowfullscreen="" frameborder="0"></iframe></div>'
            }
            else if(www.substring(0,3)=="www")
                return '<a href="http://' + www + '">' + www + '</a>';
            else return '<a href="' + www + '">' + www + '</a>';
        }
        if(mail)
            return "<a href=\"mailto:" + mail + "\">" + mail + "</a>";
        if(twitler)
            return "<a href=\"foo?bar=" + twitler + "\">#" + twitler + "</a>";
    });
}
