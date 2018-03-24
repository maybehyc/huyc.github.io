package com.huyc.may.entity;

public class CourseTwo {
    private String courseTwoId;

    private String courseTwoName;

    private String courseTwoUrl;

    public String getCourseTwoId() {
        return courseTwoId;
    }

    public void setCourseTwoId(String courseTwoId) {
        this.courseTwoId = courseTwoId == null ? null : courseTwoId.trim();
    }

    public String getCourseTwoName() {
        return courseTwoName;
    }

    public void setCourseTwoName(String courseTwoName) {
        this.courseTwoName = courseTwoName == null ? null : courseTwoName.trim();
    }

    public String getCourseTwoUrl() {
        return courseTwoUrl;
    }

    public void setCourseTwoUrl(String courseTwoUrl) {
        this.courseTwoUrl = courseTwoUrl == null ? null : courseTwoUrl.trim();
    }
}