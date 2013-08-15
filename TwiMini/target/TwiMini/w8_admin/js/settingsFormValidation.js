/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 6/8/13
 * Time: 6:40 PM
 * To change this template use File | Settings | File Templates.
 */

var timeForWhichErrorMessageIsDisplayed = 3000;

function updateUserInfo(name, description){
    init_name = name;
    init_description = description;
}

function updateInfoInForm(){
    $('#name-box').val(init_name);
    $('#description-box').val(init_description);
    $('#password-box').val("");
}

function showErrorForTime(message,time){
    $("div#message-to-be-displayed").html(message);
    $(".error-msg-container").css("display", "block");
    setTimeout(function(){
        $(".error-msg-container").css("display", "none");
    }, time);
}

function showSuccessForTime(message, time){
    $("div#message-to-be-displayed").html(message);
    $("#message-to-be-displayed").addClass("alert-success");
    $("#message-to-be-displayed").removeClass("alert-error");
    $(".error-msg-container").css("display", "block");
    setTimeout(function(){
        $(".error-msg-container").css("display", "none");
        $("#message-to-be-displayed").addClass("alert-error");
        $("#message-to-be-displayed").removeClass("alert-success");
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

var timer;
var re = /[\W]+/ ;          //any non-word character
var re2 = /[^a-zA-Z ]+/ ;           //any non-(character or space)
var re3 = /^[a-zA-Z]/ ;             //start with an alphabet
var re4 = /^[\w.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;             //Email check

var timer;
$('#name-box').keyup(function(event){
    console.log("Checking name");
    if(timer){
        clearTimeout(timer);
    }

    timer = setTimeout(function(event){
        console.log("name check - howdy!");
        name = $('#name-box').val();
        if (name.length==0){
            removeCrossRemoveTick("#name-check", "Name would not be changed.");
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
    }, 1000);
});

$('#password-box').keyup(function(event){
    console.log("Checking password");
    if(timer){
        clearTimeout(timer);
    }

    timer = setTimeout(function(event){
        console.log("password check - howdy!");
        password = $('#password-box').val();
        if (password.length==0){
            removeCrossRemoveTick("#password-check", "Password would not be changed");
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
    }, 1000);
});

$(function() {
    $('#form-update-info').submit(function(event) {
        // DO STUFF
        if ( ( ($("#name-check").hasClass("icon-remove")) || ($("#password-check").hasClass("icon-remove")) ) ){
            showErrorForTime("Cannot submit form. Please fill all fields carefully.", timeForWhichErrorMessageIsDisplayed);
            return false; // return false to cancel form action
        }
        else{
            event.preventDefault();
            var $form = $( this ),
                nameVal = $form.find( 'input[name="name"]' ).val(),
                passwordVal = $form.find( 'input[name="password"]' ).val(),
                descriptionVal = $form.find( 'textarea[name="description"]' ).val(),
                url = $form.attr( 'action' );
            console.log(nameVal);
            console.log(passwordVal);
            console.log(descriptionVal);
            var posting = $.post( url, { name: nameVal, password: passwordVal, description: descriptionVal } );
            posting.done(function( data ) {
                if (data==true){
                    showSuccessForTime("Successfully updated data.", timeForWhichErrorMessageIsDisplayed);
                    updateUserInfo(nameVal, descriptionVal);
                    updateInfoInForm();
                }
                else
                    showErrorForTime("Could not update from the server. Try again.", timeForWhichErrorMessageIsDisplayed)
            });
            //posting.fail(function() { showErrorForTime("AJAX call did not go through. Sorry for that!", timeForWhichErrorMessageIsDisplayed) })

        }
    });
});

