package com.htransplant.servlet;






import com.htransplant.beans.Attachment;
import com.htransplant.dao.ApplicationDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;


@WebServlet("/fileUpload")
public class UploadServlet extends HttpServlet {
    private String fileSavePath;
    private static final String UPLOAD_DIRECTORY = "upload";

    public void init() {
        fileSavePath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
        System.out.println("Path: " + fileSavePath);
        if (!(new File(fileSavePath)).exists()) {
            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        List<FileItem> items;
        try {
            items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                // Process form file field (input type="file").
                String fieldname = item.getFieldName();
                String filename = FilenameUtils.getName(item.getName());
                InputStream inputStream = item.getInputStream();
                //byte[] dataByte      = new byte[1024];
               // inputStream.read(dataByte);
                // ... (do your job here)
                System.out.println("Field Name: " + fieldname);
                System.out.println("File Name: " + filename);
                System.out.println("File content: " + inputStream);

                Attachment attachment = new Attachment(1, 1, inputStream,filename);
                //call DAO layer
                ApplicationDao dao = new ApplicationDao();
                dao.addAttachment(attachment);
            }
        } catch (FileUploadException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        response.getWriter().write(String.valueOf("Success"));

    }
}
