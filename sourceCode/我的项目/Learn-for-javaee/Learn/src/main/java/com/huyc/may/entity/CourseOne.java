package com.huyc.may.entity;

public class CourseOne {
    private String courseOneId;

    private String courseOneName;

    private String courseOneNo;

    public String getCourseOneId() {
        return courseOneId;
    }

    public void setCourseOneId(String courseOneId) {
        this.courseOneId = courseOneId == null ? null : courseOneId.trim();
    }

    public String getCourseOneName() {
        return courseOneName;
    }

    public void setCourseOneName(String courseOneName) {
        this.courseOneName = courseOneName == null ? null : courseOneName.trim();
    }

    public String getCourseOneNo() {
        return courseOneNo;
    }

    public void setCourseOneNo(String courseOneNo) {
        this.courseOneNo = courseOneNo == null ? null : courseOneNo.trim();
    }
}