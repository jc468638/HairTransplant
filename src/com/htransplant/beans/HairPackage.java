package com.htransplant.beans;

public class HairPackage {
    private int packageId;
    private String packageName;
    private String packageDescription;
    private String packageImgPath;
    private int packagePrice;

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getPackageDescription() {
        return packageDescription;
    }

    public void setPackageDescription(String packageDescription) {
        this.packageDescription = packageDescription;
    }

    public String getPackageImgPath() {
        return packageImgPath;
    }

    public void setPackageImgPath(String productImgPath) {
        this.packageImgPath = productImgPath;
    }

    public int getPackagePrice() {
        return packagePrice;
    }

    public void setPackagePrice(int packagePrice) {
        this.packagePrice = packagePrice;
    }
}
