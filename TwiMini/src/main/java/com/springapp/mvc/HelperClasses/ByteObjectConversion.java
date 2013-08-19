package com.springapp.mvc.HelperClasses;

import java.io.*;
import java.util.logging.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 18/8/13
 * Time: 3:42 AM
 * To change this template use File | Settings | File Templates.
 */


public class ByteObjectConversion {

    public byte[] toBytes(Object message) {
        byte[] bytes;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try{
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(message);
            oos.flush();
            oos.reset();
            bytes = baos.toByteArray();
            oos.close();
            baos.close();
        } catch(IOException e){
            bytes = new byte[] {};
            Logger.getLogger("bsdlog");
        }
        return bytes;
    }

    public Object fromBytes(byte[] body) {
        Object obj = null;
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream (body);
            ObjectInputStream ois = new ObjectInputStream (bis);
            obj =  ois.readObject();
            ois.close();
            bis.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException ex) {

            ex.printStackTrace();
        }
        return obj;
    }
}