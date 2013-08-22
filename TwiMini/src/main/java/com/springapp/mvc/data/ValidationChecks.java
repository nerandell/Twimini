package com.springapp.mvc.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 17/8/13
 * Time: 2:35 AM
 * To change this template use File | Settings | File Templates.
 */

@Repository
public class ValidationChecks {

    public Boolean isUsernameValid(String username){
        if (username==null)
            return false;
        if ((username.length()<1)||(username.length()>40))
            return false;
        if ( username.matches("(\\w)+") )
            return true;
        return false;
    }

    public Boolean isNameValid(String name){
        if (name==null)
            return false;
        if ((name.length()<1)||(name.length()>80))
            return false;
        if ( name.matches("[a-zA-Z][a-zA-Z ]+") )
            return true;
        return false;
    }

    public Boolean isEmailValid(String email){
        if (email==null)
            return false;
        if (email.length()>80)
            return false;
        if ( email.matches("[\\w.]+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}") )
            return true;
        return false;
    }

    public Boolean isPasswordValid(String password){
        if (password==null)
            return false;
        if ((password.length()<8)||(password.length()>100))
            return false;
        if ( password.matches("(\\w)+") )
            return true;
        return false;
    }

    public Boolean isDescriptionValid(String description){
        if (description==null)
            return true;
        if (description.length()>140)
            return false;
        return true;
    }

}
