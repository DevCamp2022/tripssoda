package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("ApprovalDto")
public class ApprovalDto {
    private Integer userId;
    private Integer productId;
    private Integer approval;
    private String reason;

    @Override
    public String toString() {
        return "ProductApprovalDto{" +
                "userId=" + userId +
                ", productId=" + productId +
                ", approval=" + approval +
                ", reason='" + reason + '\'' +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getApproval() {
        return approval;
    }

    public void setApproval(Integer approval) {
        this.approval = approval;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

}
