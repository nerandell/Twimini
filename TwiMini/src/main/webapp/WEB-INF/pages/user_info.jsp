<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Twitter Bootstrap navbar Example</title>
    <meta name="description" content="Twitter Bootstrap navbar Example">
    <link href="twitter-bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
</head>
<body style="padding-top: 40px">
<div id="top bar" class="container">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav">
                    <li class="active">
                        <a class="brand" href="#">TwiMini</a>
                    </li>
                    <li><a href="#"><i class="icon-home"></i> Home</a></li>
                    <li><a href="#"><i class="icon-user"></i> Me</a></li>
                </ul>
                <div class = "pull-right">
                    <form class="navbar-search pull-left">
                        <input type="text" id="search" placeholder="Search"  data-provide="typeahead" data-items="4">

                    </form>
                    <ul class="nav">
                        <li class="dropdown">
                            <a href="#"
                               class="dropdown-toggle"
                               data-toggle="dropdown">
                                <i class="icon-cog"></i>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Web Design</a></li>
                                <li><a href="#">Web development</a></li>
                                <li><a href="#">Wordpress Theme development</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <!-- left menu starts -->
        <div class="span4 main-menu-span">
            <div class="well nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li><a class="ajax-link" href="index.html"><i class="icon-home"></i><span class="hidden-tablet"> Tweets</span></a></li>
                    <li><a class="ajax-link" href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> Following</span></a></li>
                    <li><a class="ajax-link" href="form.html"><i class="icon-edit"></i><span class="hidden-tablet"> Follower</span></a></li>
                </ul>
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li class="pull-left">
                        <label><i class="icon-pencil"></i> Compose a tweet <br/>
                        </label>
                    </li>
                    <li>
                        <form class="well">
                            <textarea id="tweet" style="vertical-align: text-top" type="text" placeholder="Enter the tweet"> </textarea>
                            <div class="controls">
                                <button type="submit" class="btn">Submit</button>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div><!--/span-->
        <div class="span8">
            <div class="thumbnail" style="background: url('twitter-bootstrap/img/default_back.jpg')">
                <div class="caption">
                    <h5>Product detail</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore       magna aliqua.</p>
                    <p><a href="#" class="btn btn-success">Buy</a> <a href="#" class="btn btn-warning">Try</a></p>
                </div>
            </div>
            <div class="container">
                Hello World
            </div>
        </div>
        <!-- left menu ends -->
    </div>
</div>
<script src="twitter-bootstrap/docs/assets/js/jquery.js"></script>
<script src="twitter-bootstrap/docs/assets/js/bootstrap-dropdown.js"></script>
<script src="twitter-bootstrap/docs/assets/js/bootstrap-typeahead.js"></script>
<script>
    var subjects = ${users};
    $('#search').typeahead({source: subjects})

    $('#tweet').click(function(){
        console.log("Hello");
        $('#tweet').animate({height:'100px'}, 500);
        //this method increases the height to 72px
    });

</script>
</body>
</html>