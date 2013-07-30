package com.springapp.mvc;

import javax.servlet.http.HttpServletRequest;

public interface ImageSettings {
    public void uploadImage(String path, HttpServletRequest httpServletRequest);
    public byte[] getImage(String username);
    public void updateImage(String path, HttpServletRequest httpServletRequest);
}
