package com.liu.article.pojo;

import java.io.Serializable;

public class Reply implements Serializable {

    //回复信息编号
    private int lr_id;

    //回复人
    private String lr_name;

    //回复日期
    private String lr_date;

    //回复内容
    private String lr_content;

    //给谁留言
    private String lr_for_name;

    //哪条留言的回复
    private String lr_for_word;

    //给哪条回复信息回复的
    private String lr_for_reply;

    //在哪条文章下的回复
    private String lr_for_article_id;

    public int getLr_id() {
        return lr_id;
    }

    public void setLr_id(int lr_id) {
        this.lr_id = lr_id;
    }

    public String getLr_name() {
        return lr_name;
    }

    public void setLr_name(String lr_name) {
        this.lr_name = lr_name;
    }

    public String getLr_date() {
        return lr_date;
    }

    public void setLr_date(String lr_date) {
        this.lr_date = lr_date;
    }

    public String getLr_content() {
        return lr_content;
    }

    public void setLr_content(String lr_content) {
        this.lr_content = lr_content;
    }

    public String getLr_for_name() {
        return lr_for_name;
    }

    public void setLr_for_name(String lr_for_name) {
        this.lr_for_name = lr_for_name;
    }

    public String getLr_for_word() {
        return lr_for_word;
    }

    public void setLr_for_word(String lr_for_word) {
        this.lr_for_word = lr_for_word;
    }

    public String getLr_for_reply() {
        return lr_for_reply;
    }

    public void setLr_for_reply(String lr_for_reply) {
        this.lr_for_reply = lr_for_reply;
    }

    public String getLr_for_article_id() {
        return lr_for_article_id;
    }

    public void setLr_for_article_id(String lr_for_article_id) {
        this.lr_for_article_id = lr_for_article_id;
    }
}
