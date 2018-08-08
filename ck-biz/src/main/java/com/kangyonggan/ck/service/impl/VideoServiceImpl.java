package com.kangyonggan.ck.service.impl;

import com.github.ofofs.jca.annotation.Log;
import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.util.StringUtil;
import com.kangyonggan.ck.model.Video;
import com.kangyonggan.ck.service.VideoService;
import com.kangyonggan.common.BaseService;
import com.kangyonggan.common.Params;
import com.kangyonggan.common.Query;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Service
public class VideoServiceImpl extends BaseService<Video> implements VideoService {

    @Override
    public List<Video> findVideosByPage(Params params) {
        Example example = new Example(Video.class);

        Example.Criteria criteria = example.createCriteria();
        Query query = params.getQuery();

        criteria.andEqualTo("status", "Y");

        String map = query.getString("map");
        if (StringUtils.isNotEmpty(map)) {
            criteria.andEqualTo("map", map);
        }

        String sort = params.getSort();
        String order = params.getOrder();
        if (!StringUtil.hasEmpty(sort, order)) {
            example.setOrderByClause(sort + " " + order.toUpperCase());
        } else {
            example.setOrderByClause("hits desc");
        }

        PageHelper.startPage(params.getPageNum(), params.getPageSize());
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public void saveVideo(Video video) {
        myMapper.insertSelective(video);
    }

    @Override
    @Log
    public Video findVideoById(Long id) {
        Video video = new Video();
        video.setId(id);
        video.setStatus("Y");

        return myMapper.selectOne(video);
    }

    @Override
    @Log
    public void updateVideoHits(Long id) {
        Video video = findVideoById(id);
        if (video == null) {
            return;
        }
        video.setHits(video.getHits() + 1);

        myMapper.updateByPrimaryKeySelective(video);
    }
}
