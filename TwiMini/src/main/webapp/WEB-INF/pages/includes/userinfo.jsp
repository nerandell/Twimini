<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
    $(function() {
        var availableTags = [
            "ActionScript",
            "AppleScript",
            "Asp",
            "BASIC",
            "C",
            "C++",
            "Clojure",
            "COBOL",
            "ColdFusion",
            "Erlang",
            "Fortran",
            "Groovy",
            "Haskell",
            "Java",
            "JavaScript",
            "Lisp",
            "Perl",
            "PHP",
            "Python",
            "Ruby",
            "Scala",
            "Scheme"
        ];

        function split( val ) {
            return val.split(/[ ]+/);
        }

        function extractLast( term ) {
            return split( term ).pop();
        }

        $( ".tags" )
            // don't navigate away from the field on tab when selecting an item
                .bind( "keydown", function( event ) {
                    console.log("keydown");
                    if ( event.keyCode === $.ui.keyCode.TAB &&
                            $( this ).data( "ui-autocomplete" ).menu.active ) {
                        event.preventDefault();
                    }
                })
                .autocomplete({
                    minLength: 0,
                    source: function( request, response ) {
                        console.log(extractLast(request.term).charAt(0));
                        if(extractLast(request.term).charAt(0)==='@') {
                            $.getJSON("/MiniTwitter/API/users/taguser?query="+extractLast(request.term).substr(1),function(data) {
                                console.log(data);
                                response( $.ui.autocomplete.filter(
                                        data, extractLast(request.term).substr(1)));
                            });
                        }
                        if(extractLast(request.term).charAt(0)==='#') {
                            $.getJSON("/MiniTwitter/API/hashtags/findtag?query="+extractLast(request.term).substr(1),function(data) {
                                console.log(data);
                                response( $.ui.autocomplete.filter(
                                        data, extractLast(request.term).substr(1)));
                            });
                        }
                    },
                    focus: function() {
                        console.log("focus");
                        // prevent value inserted on focus
                        return false;
                    },
                    select: function( event, ui ) {
                        console.log("select");
                        var terms = split( this.value );
                        // remove the current input
                        var last_ele = terms.pop();
                        if(last_ele.charAt(0)==='@') {
                            // add the selected item
                            terms.push( '@'+ui.item.value );
                        }
                        else if(last_ele.charAt(0)==='#') {
                            // add the selected item
                            terms.push( '#'+ui.item.value );
                        }
                        // add placeholder to get the comma-and-space at the end
                        terms.push( "" );
                        this.value = terms.join( " " );
                        return false;
                    }
                });
    });
</script>

<div id="modal-gallery" class="modal modal-gallery hide fade" tabindex="-1">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <h3 class="modal-title"></h3>
    </div>
    <div class="modal-body"><div class="modal-image">
    </div></div>
    <div class="modal-footer">
        <a class="btn btn-primary modal-next">Next <i class="icon-arrow-right icon-white"></i></a>
        <a class="btn btn-info modal-prev"><i class="icon-arrow-left icon-white"></i> Previous</a>
        <a class="btn btn-success modal-play modal-slideshow" data-slideshow="5000"><i class="icon-play icon-white"></i> Slideshow</a>
        <a class="btn modal-download" target="_blank"><i class="icon-download"></i> Download</a>
    </div>
</div>

<div id="gallery" data-toggle="modal-gallery" data-target="#modal-gallery" style="display:none;">
</div>

<div class="page-header position-relative">
    <h1>
        <img class="nav-user-photo" src="/MiniTwitter/API/users/profile_image?username=${info.username}" style="height: 75px; float: left; padding-right: 10px" alt="Jason's Photo" />
        ${info.name}
        <small>
            @${info.username}
        </small>
        <div class="grey">
            <small>
                ${info.description}
                <div class="pull-right" id="relationButton">
                </div>
            </small>
        </div>
    </h1>
</div><!--/.page-header-->

<div class="row-fluid">
    <div class="span12">
        <div class="widget-box ">
            <div class="widget-body">
                <div class="widget-main no-padding">
                    <form target="hiddenIframe" method="post" action="/MiniTwitter/API/statuses/update" id="tweetForm" enctype="multipart/form-data">
                        <div class="form-actions input-append">
                            <input placeholder="Compose a tweet..." name="status" type="text" class="width-75 ui-widget tags" id="tweet" />
                            <button class="btn btn-danger no-radius" onclick="$('#tweetForm').submit(); top.location.href=top.location.href">
                                <i class="icon-pencil"></i>
                                <span class="hidden-phone">Tweet</span>
                            </button>
                            <button class="btn btn-info no-radius" onclick="uploadFile(); return false;">
                                <i class="icon-camera"></i>
                            </button>
                            <button class="btn btn-info no-radius" onclick="getLocation(); return false;">
                                <i class="icon-location-arrow"></i>
                            </button>
                            <input id="upload" name="files[]" type="file" multiple style="visibility:hidden;"/>
                            <input name="location" value="-1" type="text" id="location" style="visibility: hidden;"/>
                            <input name="latitude" value="-1" type="text" id="latitude" style="visibility: hidden;"/>
                            <input name="longitude" value="-1" type="text" id="longitude" style="visibility: hidden;"/>

                        </div>
                    </form>
                    <iframe name="hiddenIframe" id="hiddenIframe" style="display:none;"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="alert alert-success" id = "success-message" style="display:none;">
    <a class="close" data-dismiss="alert">x</a>
    Location successfully added
</div>

<div class="alert alert-success text-center" id = "notification-message" style="display:none;">
    <a class="notify" data-time="" onclick="addRecentTweets(this);">
        <span id="notification-number"></span>
    </a>
</div>

<script type="text/javascript" src="../../w8_admin/themes/js/load-image.js"></script>
<script type="text/javascript" src="../../w8_admin/themes/js/bootstrap-image-gallery.js"></script>
<script type="text/javascript" src="../../w8_admin/themes/js/main.js"></script>

<div class="clearfix">
    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}">
            <span class="grey">Tweets</span>
            <h4 class="bigger pull-right">${num_of_tweets}</h4>
        </a>
    </div>
    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}/followers">
            <span class="grey">Followers</span>
            <h4 class="bigger pull-right">${num_followers}</h4>
        </a>
    </div>
    <div class="grid3">
        <a href="/MiniTwitter/Website/${info.username}/following">
            <div>
                <span class="grey">Following</span>
                <h4 class="bigger pull-right">${num_following}</h4>
            </div>
        </a>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {
        var currentLoggedUser = '${currentLoggedUser}';
        var user = '${info.username}';
        if(currentLoggedUser===user) return;
        if(currentLoggedUser!=="-1") {
            $.ajax({
                url: '/MiniTwitter/API/friendships/exists?follower='+currentLoggedUser+'&following='+user,
                type: 'GET',
                htmlContentType: 'text/html',
                success:function(data)
                {
                    if(data==="true") {
                        $('#relationButton').append('<div><a class="switch" href="#"><span class="label label-large label-important" onclick="unfollow(\'${info.username}\',this)">Unfollow</span></a></div>');
                    }
                    else {
                        $('#relationButton').append('<div><a class="switch" href="#"><span class="label label-large label-success" onclick="follow(\'${info.username}\',this)">Follow</span></a></div>');
                    }
                }
            });
        }
        else {
            $('#relationButton').append('<div><a class="switch" href="#"><span class="label label-large label-success" onclick="follow(\'${info.username}\',this)">Follow</span></a></div>');
        }

    });

    function uploadFile() {
        var element = document.getElementById("upload");
        element.click();
    }

    function getLocation() {
        var geocoder;
        geocoder = new google.maps.Geocoder();

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
        }

        //Get the latitude and the longitude;
        function successFunction(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            codeLatLng(lat, lng);
            $('#success-message').show();
        }

        function errorFunction(){
            alert("Geocoder failed");
        }

        function codeLatLng(lat, lng) {

            var latlng = new google.maps.LatLng(lat, lng);
            geocoder.geocode({'latLng': latlng}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    console.log(results)
                    if (results[1]) {
                        //formatted address
                        //find country name
                        for (var i=0; i<results[0].address_components.length; i++) {
                            for (var b=0;b<results[0].address_components[i].types.length;b++) {

                                //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                                if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
                                    //this is the object you are looking for
                                    city= results[0].address_components[i];
                                    break;
                                }
                            }
                        }
                        $('#location').val(city.short_name + " " + city.long_name);
                        $('#latitude').val(lat);
                        $('#longitude').val(lng);
                        console.log($('#location').val());
                    } else {
                        alert("No results found");
                    }
                } else {
                    alert("Geocoder failed due to: " + status);
                }
            });
        }
    }

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
                    $parent.replaceWith('<div><a class="switch" href="#"><span class="label label-large label-important" onclick="unfollow(\''+username+'\',this)">Unfollow</span></a></div>');
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
                $parent.replaceWith('<div><a class="switch" href="#"><span class="label label-large label-success" onclick="follow(\''+username+'\',this)">Follow</span></a></div>');
            }
        });
    }


</script>
