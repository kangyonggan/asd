package com.kangyonggan.ck.service;

import com.kangyonggan.ck.model.Video;
import com.kangyonggan.common.Params;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
public interface VideoService {

    /**
     * 分页查找视频
     *
     * @param params
     * @return
     */
    List<Video> findVideosByPage(Params params);

    /**
     * 保存视频
     *
     * @param video
     */
    void saveVideo(Video video);

    /**
     * 查找视频
     *
     * @param id
     * @return
     */
    Video findVideoById(Long id);

    /**
     * 更新播放次数
     *
     * @param id
     */
    void updateVideoHits(Long id);
}
