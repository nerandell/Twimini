/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 22/7/13
 * Time: 7:01 PM
 * To change this template use File | Settings | File Templates.
 */
function signUpClicked(){
    $('.logIn-class-inputs').hide(200, "swing");
    document.getElementById('signUp-overlay').className = "MyClass";
    document.getElementById('logIn-overlay').className = "layer-over-overlay";
    $('.signUp-class-inputs').show(200, "swing");
}

function logInClicked(){
    $('.signUp-class-inputs').hide(200, "swing");
    document.getElementById('logIn-overlay').className = "MyClass";
    document.getElementById('signUp-overlay').className = "layer-over-overlay";
    $('.logIn-class-inputs').show(200, "swing");
}


