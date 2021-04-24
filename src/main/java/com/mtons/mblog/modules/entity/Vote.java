package com.mtons.mblog.modules.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @Author: wcy
 * @Date: 2019/12/29
 */
@Entity
@Table(name = "mto_vote")
//@FilterDefs({
//        @FilterDef(name = "POST_STATUS_FILTER", defaultCondition = "status = 0" )})
//@Filters({ @Filter(name = "POST_STATUS_FILTER") })
//@Indexed(index = "post")
public class Vote implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    /**
     * 所属用户
     */
    @Column(name = "u_id")
    private long userId;

    /**
     * 内容ID
     */
    @Column(name = "p_id")
    private long postId;

    private int num;
    private int status;
    private String status_str;
    private String create_date;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getPostId() {
        return postId;
    }

    public void setPostId(long postId) {
        this.postId = postId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatus_str() {
        return status_str;
    }

    public void setStatus_str(String status_str) {
        this.status_str = status_str;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
}
