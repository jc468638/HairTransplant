package com.htransplant.beans;

public class Enquiry {
    private int enquiryId;
    private int enquiryRef;
    private String userEmail;

    public int getEnquiryId() {
        return enquiryId;
    }

    public void setEnquiryId(int enquiryId) {
        this.enquiryId = enquiryId;
    }

    public int getEnquiryRef() {
        return enquiryRef;
    }

    public void setEnquiryRef(int enquiryRef) {
        this.enquiryRef = enquiryRef;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getUserSex() {
        return userSex;
    }

    public void setUserSex(int userSex) {
        this.userSex = userSex;
    }

    public int getUserWeight() {
        return userWeight;
    }

    public void setUserWeight(int userWeight) {
        this.userWeight = userWeight;
    }

    public String getEnquiryTitle() {
        return enquiryTitle;
    }

    public void setEnquiryTitle(String enquiryTitle) {
        this.enquiryTitle = enquiryTitle;
    }

    public String getEnquiryMessage() {
        return enquiryMessage;
    }

    public void setEnquiryMessage(String enquiryMessage) {
        this.enquiryMessage = enquiryMessage;
    }

    private String userName;
    private String userLastName;
    private String userPhone;
    private int userSex;
    private int userWeight;
    private String enquiryTitle;
    private String enquiryMessage;

    public Enquiry(int enquiryRef, String userEmail, String userName, String userLastName, String userPhone, int userSex, int userWeight, String enquiryTitle, String enquiryMessage) {

        this.enquiryRef = enquiryRef;
        this.userEmail = userEmail;
        this.userName = userName;
        this.userLastName = userLastName;
        this.userPhone = userPhone;
        this.userSex = userSex;
        this.userWeight = userWeight;
        this.enquiryTitle = enquiryTitle;
        this.enquiryMessage = enquiryMessage;
    }


}
