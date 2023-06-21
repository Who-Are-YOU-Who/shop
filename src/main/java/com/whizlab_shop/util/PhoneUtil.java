package com.whizlab_shop.util;

public class PhoneUtil {

    public String phoneRefactor(String phoneNumber){

        String phone = null;

        StringBuffer sb = new StringBuffer(phoneNumber);

        if(phoneNumber.length() == 11){

            sb.insert(3, "-");
            sb.insert(8, "-");

            phone = sb.toString();

        }

        if(phoneNumber.length() == 10){

            sb.insert(3, "-");
            sb.insert(7, "-");

            phone = sb.toString();

        }

        return phone;
    }


}
