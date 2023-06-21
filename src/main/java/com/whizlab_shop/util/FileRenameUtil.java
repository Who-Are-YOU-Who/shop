package com.whizlab_shop.util;

import java.io.File;

public class FileRenameUtil {

    public static String checkSameFileName(String fileName, String path){

        int period = fileName.lastIndexOf(".");

        String fName = fileName.substring(0, period);

        String suffix = fileName.substring(period);

        String savaFileName = path + System.getProperty("file.separatof") + fileName;

        File file = new File(savaFileName);

        int idx = 1;

        while (file != null && file.exists()){

            StringBuffer sb = new StringBuffer();

            sb.append(fName);
            sb.append(idx++);
            sb.append(suffix);

            fileName = sb.toString();

            savaFileName = path + System.getProperty("file.separator") + fileName;

            file = new File(savaFileName);
        }

        return fileName;
    }


}
