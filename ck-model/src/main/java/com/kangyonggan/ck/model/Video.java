package com.kangyonggan.ck.model;

import java.util.Date;
import javax.persistence.*;

import com.github.ofofs.jca.annotation.Serial;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Table(name = "tb_video")
@Data
@Serial
public class Video {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 视频标题
     */
    private String title;

    /**
     * 作者
     */
    private String author;

    /**
     * 赛道
     */
    private String map;

    /**
     * 播放次数
     */
    private Integer hits;

    /**
     * 视频封面
     */
    private String cover;

    /**
     * 视频路径
     */
    private String src;

    /**
     * 审批状态:{N:待审批, R:已拒绝, Y:已审批}
     */
    private String status;

    /**
     * 审批意见
     */
    @Column(name = "reply_msg")
    private String replyMsg;

    /**
     * 逻辑删除:{0:未删除, 1:已删除}
     */
    @Column(name = "is_deleted")
    private Byte isDeleted;

    /**
     * 创建时间
     */
    @Column(name = "created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @Column(name = "updated_time")
    private Date updatedTime;
}