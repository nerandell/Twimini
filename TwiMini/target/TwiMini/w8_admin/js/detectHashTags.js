function hashify(text) {
    console.log('Detecting hash tags for  '+text);
    var re = [
        "\\b((?:https?|ftp)://[^\\s\"'<>]+)\\b",
        "\\b(www\\.[^\\s\"'<>]+)\\b",
        "\\b(\\w[\\w.+-]*@[\\w.-]+\\.[a-z]{2,6})\\b",
        "#([a-z0-9]+)"];
    re = new RegExp(re.join('|'), "gi");
    return text.replace(re, function(match, url, www, mail, twitler){
        if(twitler) {

        }
    });
}

