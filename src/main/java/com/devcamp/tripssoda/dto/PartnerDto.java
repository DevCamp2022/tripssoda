package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("PartnerDto")
public class PartnerDto {
    private Integer userId;
    private Integer regNumber;
    private String companyName;
    private String intro;
    private String introAttachment;
    private String serviceRegion;
    private String canceledAt;
    private String productType;
    private String managerName;
    private String managerTel;
    private Integer termsAgreement;
    private Integer onPartnership;
    private String conclusionDate;
    private String createAt;
    private Integer createBy;
    private String updatedAt;
    private Integer updatedBy;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRegNumber() {
        return regNumber;
    }

    public void setRegNumber(Integer regNumber) {
        this.regNumber = regNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getIntroAttachment() {
        return introAttachment;
    }

    public void setIntroAttachment(String introAttachment) {
        this.introAttachment = introAttachment;
    }

    public String getServiceRegion() {
        return serviceRegion;
    }

    public void setServiceRegion(String serviceRegion) {
        this.serviceRegion = serviceRegion;
    }

    public String getCanceledAt() {
        return canceledAt;
    }

    public void setCanceledAt(String canceledAt) {
        this.canceledAt = canceledAt;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerTel() {
        return managerTel;
    }

    public void setManagerTel(String managerTel) {
        this.managerTel = managerTel;
    }

    public Integer getTermsAgreement() {
        return termsAgreement;
    }

    public void setTermsAgreement(Integer termsAgreement) {
        this.termsAgreement = termsAgreement;
    }

    public Integer getOnPartnership() {
        return onPartnership;
    }

    public void setOnPartnership(Integer onPartnership) {
        this.onPartnership = onPartnership;
    }

    public String getConclusionDate() {
        return conclusionDate;
    }

    public void setConclusionDate(String conclusionDate) {
        this.conclusionDate = conclusionDate;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String toString() {
        return "PartnerDto{" +
                "userId=" + userId +
                ", regNumber=" + regNumber +
                ", companyName='" + companyName + '\'' +
                ", intro='" + intro + '\'' +
                ", introAttachment='" + introAttachment + '\'' +
                ", serviceRegion='" + serviceRegion + '\'' +
                ", canceledAt='" + canceledAt + '\'' +
                ", productType='" + productType + '\'' +
                ", managerName='" + managerName + '\'' +
                ", managerTel='" + managerTel + '\'' +
                ", termsAgreement=" + termsAgreement +
                ", onPartnership=" + onPartnership +
                ", conclusionDate='" + conclusionDate + '\'' +
                ", createAt='" + createAt + '\'' +
                ", createBy=" + createBy +
                ", updatedAt='" + updatedAt + '\'' +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
