<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Twitter Bootstrap navbar Example</title>
    <meta name="description" content="Twitter Bootstrap navbar Example">
    <link href="twitter-bootstrap/docs/assets/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div id="top bar" class="container-fluid">
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
<script src="twitter-bootstrap/docs/assets/js/jquery.js"></script>
<script src="twitter-bootstrap/docs/assets/js/bootstrap-dropdown.js"></script>
<script src="twitter-bootstrap/docs/assets/js/bootstrap-typeahead.js"></script>
<script>
    var subjects = ${users};
    $('#search').typeahead({source: subjects})
</script>
</body>
</html>