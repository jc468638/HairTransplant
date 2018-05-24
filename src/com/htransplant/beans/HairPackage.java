package com.htransplant.beans;

public class HairPackage {
    private int packageId;
    private String packageName;
    private String packageImgPath;

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

    public String getPackageImgPath() {
        return packageImgPath;
    }

    public void setPackageImgPath(String productImgPath) {
        this.packageImgPath = productImgPath;
    }
}
