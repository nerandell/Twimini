/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 29/7/13
 * Time: 8:08 PM
 * To change this template use File | Settings | File Templates.
 */

var timeForWhichErrorMessageIsDisplayed = 3000;
var timeToAjaxCallAfterKeyUp = 1000;

function showErrorForTime(message,time){
    $("div#message-to-be-displayed").html(message);
    $(".error-msg-container").css("display", "block");
    setTimeout(function(){
        $(".error-msg-container").css("display", "none");
    }, time);
}

function removeTickShowCross(selector, message){
    $(selector).removeClass("icon-ok");
    $(selector).addClass("icon-remove");
    $(selector).css("margin-top","8px");
    showErrorForTime(message, timeForWhichErrorMessageIsDisplayed);
}

function removeCrossShowTick(selector){
    $(selector).removeClass("icon-remove");
    $(selector).addClass("icon-ok");
    $(selector).css("margin-top","8px");
    $(".error-msg-container").css("display", "none");
}

function removeCrossRemoveTick(selector, message){
    $(selector).removeClass("icon-ok");
    $(selector).removeClass("icon-remove");
    showErrorForTime(message, timeForWhichErrorMessageIsDisplayed);
}

var re = /[\W]+/ ;          //any non-word character
var re2 = /[^a-zA-Z ]+/ ;           //any non-(character or space)
var re3 = /^[a-zA-Z]/ ;             //start with an alphabet
var re4 = /^[\w.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;             //Email check

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var timer;

$('#username-box').keyup(function(event){
    if(timer){
        clearTimeout(timer);
    }

    timer = setTimeout(function(event){
        usernameCheckCore();
    }, timeToAjaxCallAfterKeyUp);
});

$('#username-box').blur(function(event){
    usernameCheckCore();
});

function usernameCheckCore(){
    console.log("username check - howdy!");
    username = $('#username-box').val();
    if (username.length==0){
        removeCrossRemoveTick("#username-check", "Username cannot be null.");
        return;
    }
    else if (username.length<8){
        removeTickShowCross("#username-check", "Length of username should at least be 8");
        return;
    }
    else if (username.length>40){
        removeTickShowCross("#username-check", "Length of username should at most be 40");
        return;
    }

    else if (re.test(username)){
        removeTickShowCross("#username-check", "Only alphanumeric and underscores allowed in username");
    }
    else{
        //////////////////////////// here's the ajax request //////////////////////////////
        $.getJSON("/MiniTwitter/API/isUserPresent?"+"username="+username, function(isUserPresent) {
            console.log("Into ajax call - checking username");
            console.log(isUserPresent);
            if (isUserPresent==true){
                removeTickShowCross("#username-check", "Selected username is already taken.");
            }
            else{
                removeCrossShowTick("#username-check");
            }
        });
        //////////////////////////// ----------------------- //////////////////////////////
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var timer;

$('#name-box').keyup(function(event){
    if(timer){
        clearTimeout(timer);
    }

    timer = setTimeout(function(event){
        nameCheckCore();
    }, timeToAjaxCallAfterKeyUp);
});

$('#name-box').blur(function(event){
    nameCheckCore();
});

function nameCheckCore(){
    console.log("name check - howdy!");
    name = $('#name-box').val();
    if (name.length==0){
        removeCrossRemoveTick("#name-check", "Name cannot be empty.");
        return;
    }
    else if (name.length>80){
        removeTickShowCross("#name-check", "Name should be at most 80 characters long.");
        return;
    }
    else if (!re3.test(name)){
        removeTickShowCross("#name-check", "Name should start with alphabet.")
    }
    else if (re2.test(name)){
        removeTickShowCross("#name-check", "Only alphabets and spaces allowed in name.")
    }
    else{
        removeCrossShowTick("#name-check");
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var timer;

$('#email-box').keyup(function(event){
    if(timer){
        clearTimeout(timer);
    }
    timer = setTimeout(function(event){
        emailCheckCore();
    }, timeToAjaxCallAfterKeyUp);
});

$('#email-box').blur(function(event){
    emailCheckCore();
});


function emailCheckCore(){
    console.log("email check - howdy!");
    email = $('#email-box').val();
    if (email.length==0){
        removeCrossRemoveTick("#email-check", "Email cannot be empty.");
        return;
    }
    else if (email.length>80){
        removeCrossRemoveTick("#email-check", "Email should be at most 80 characters long.");
        return;
    }
    else if (!re4.test(email)){
        removeTickShowCross("#email-check", "Enter a proper email address.")
    }
    else{
        //////////////////////////// here's the ajax request //////////////////////////////
        $.getJSON("/MiniTwitter/API/isEmailPresent?"+"email="+email, function(isEmailPresent) {
            console.log("Into ajax call - checking email");
            console.log(isEmailPresent);
            if (isEmailPresent==true){
                removeTickShowCross("#email-check", "An account with this email already exists.");
            }
            else{
                removeCrossShowTick("#email-check");
            }
        });
        //////////////////////////// ----------------------- //////////////////////////////
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var timer;

$('#password-box').keyup(function(event){
    if(timer){
        clearTimeout(timer);
    }
    timer = setTimeout(function(event){
        passwordCheckCore();
    }, timeToAjaxCallAfterKeyUp);
});

$('#password-box').blur(function(event){
    passwordCheckCore();
});

function passwordCheckCore(){
    console.log("password check - howdy!");
    password = $('#password-box').val();
    if (password.length==0){
        removeCrossRemoveTick("#password-check", "Password cannot be null.");
        return;
    }
    else if (password.length<8){
        removeTickShowCross("#password-check", "Length of password should at least be 8");
        return;
    }
    else if (password.length>100){
        removeTickShowCross("#password-check", "Length of password should at most be 100");
        return;
    }

    else if (re.test(password)){
        removeTickShowCross("#password-check", "Only alphanumeric and underscores allowed in password");
    }
    else{
        removeCrossShowTick("#password-check");
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(function() {
    $('#form-signing-up').submit(function() {
        // DO STUFF
        if ( ($("#username-check").hasClass("icon-ok")) && ($("#name-check").hasClass("icon-ok")) && ($("#password-check").hasClass("icon-ok")) && ($("#email-check").hasClass("icon-ok")) )
            return true; // return false to cancel form action
        else{
            showErrorForTime("Cannot submit form. Please fill all fields carefully.", timeForWhichErrorMessageIsDisplayed);
            return false;
        }
    });
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////