package com.kangyonggan.ck.controller;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.util.FileUpload;
import com.kangyonggan.ck.model.Video;
import com.kangyonggan.ck.service.VideoService;
import com.kangyonggan.common.Params;
import com.kangyonggan.common.web.BaseController;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Controller
@RequestMapping("video")
public class VideoController extends BaseController {

    @Autowired
    private VideoService videoService;

    @Value("${file.root.path}")
    private String fileRootPath;

    /**
     * 大神视频列表
     *
     * @param model
     * @return
     */
    @GetMapping
    public String index(Model model) {
        Params params = getRequestParams();
        params.setPageSize(20);
        List<Video> videos = videoService.findVideosByPage(params);

        model.addAttribute("page", new PageInfo<>(videos));
        return "video/index";
    }

    /**
     * 上传视频界面
     *
     * @return
     */
    @GetMapping("upload")
    public String upload() {
        return "video/upload";
    }

    /**
     * 上传视频
     *
     * @param video
     * @param file
     * @param coverFile
     * @param model
     * @return
     * @throws FileUploadException
     */
    @PostMapping("upload")
    public String upload(@ModelAttribute(value = "video") @Valid Video video,
                         @RequestParam(value = "file") MultipartFile file,
                         @RequestParam(value = "coverFile") MultipartFile coverFile,
                         Model model) throws FileUploadException {
        String result = "上传成功";
        if (file != null || coverFile == null) {
            if (!check(file, coverFile)) {
                result = "现在前端还没做校验，不要调皮，老老实实上传视频和封面";
            } else {
                String src = FileUpload.upload(fileRootPath, "video/", file, "VIDEO");
                String cover = FileUpload.upload(fileRootPath, "video/", coverFile, "COVER");

                video.setSrc(src);
                video.setCover(cover);
                // TODO 暂时算审核通过，枚举后面再做
                video.setStatus("Y");

                videoService.saveVideo(video);
            }
        } else {
            result = "现在前端还没做校验，不要调皮，老老实实上传视频和封面";
        }

        model.addAttribute("result", result);
        return "video/upload-result";
    }

    /**
     * 播放视频
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("{id:[\\d+]}")
    public String detail(@PathVariable("id") Long id, Model model) {
        videoService.updateVideoHits(id);
        Video video = videoService.findVideoById(id);
        if (video == null) {
            model.addAttribute("result", "该视频不存在");
        } else {
            model.addAttribute("video", video);
        }
        return video == null ? "video/upload-result" : "video/detail";
    }

    private boolean check(MultipartFile file, MultipartFile coverFile) {
        if ("mp4,ogg,webm,swf".indexOf(getExtend(file.getOriginalFilename())) == -1) {
            return false;
        }
        if ("jpg,jpeg,png,gif,bmp".indexOf(getExtend(coverFile.getOriginalFilename())) == -1) {
            return false;
        }

        return true;
    }

    private String getExtend(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
    }

}
