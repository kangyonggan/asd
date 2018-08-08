DROP DATABASE IF EXISTS ck;

CREATE DATABASE ck
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE ck;

-- ----------------------------
--  Table structure for tb_video
-- ----------------------------
DROP TABLE
IF EXISTS tb_video;

CREATE TABLE tb_video
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  title        VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '视频标题',
  author       VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '作者',
  map          VARCHAR(32)                           NOT NULL                    DEFAULT ''
  COMMENT '赛道',
  hits         INTEGER(11)                           NOT NULL                    DEFAULT 0
  COMMENT '播放次数',
  cover        VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '视频封面',
  src          VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '视频路径',
  status       CHAR(1)                               NOT NULL                    DEFAULT 'N'
  COMMENT '审批状态:{N:待审批, R:已拒绝, Y:已审批}',
  reply_msg    VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '审批意见',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '用户表';
CREATE INDEX ix_map
  ON tb_video (map);
