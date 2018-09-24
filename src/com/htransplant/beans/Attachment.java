package com.htransplant.beans;

import java.io.InputStream;

public class Attachment {
    private int attch_id;
    private int attch_type;
    private int attch_type_id;
    private InputStream attch_file;
    private String attach_name;

    public int getAttch_id() {
        return attch_id;
    }

    public void setAttch_id(int attch_id) {
        this.attch_id = attch_id;
    }

    public int getAttch_type() {
        return attch_type;
    }

    public void setAttch_type(int attch_type) {
        this.attch_type = attch_type;
    }

    public int getAttch_type_id() {
        return attch_type_id;
    }

    public InputStream getAttch_file() {
        return attch_file;
    }

    public void setAttch_file(InputStream attch_file) {
        this.attch_file = attch_file;
    }

    public void setAttch_type_id(int attch_type_id) {
        this.attch_type_id = attch_type_id;
    }

    public String getAttach_name() {
        return attach_name;
    }

    public void setAttach_name(String attach_name) {
        this.attach_name = attach_name;
    }

    public Attachment(int attch_type, int attch_type_id, InputStream attch_file, String attach_name) {
        this.attch_type = attch_type;
        this.attch_type_id = attch_type_id;
        this.attch_file = attch_file;
        this.attach_name = attach_name;
    }
}
