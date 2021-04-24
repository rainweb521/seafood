package com.mtons.mblog.web.controller.site.user;

import com.mtons.mblog.base.lang.Result;
import com.mtons.mblog.modules.data.AccountProfile;
import com.mtons.mblog.modules.service.PostService;
import com.mtons.mblog.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @Author: wcy
 * @Date: 2019/12/29
 */
@RestController
@RequestMapping("/vote")
public class VoteController extends BaseController {
    @Autowired
    private PostService postService;

    @RequestMapping("/addvote")
    public Result addvote(Long id){
        Result data = Result.failure("操作失败");
        if (id != null) {
            try {
                LocalDateTime now = LocalDateTime.now();
                String timeStr = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now);
                AccountProfile up = getProfile();
                postService.addvote(up.getId(), id);
                data = Result.success();
            } catch (Exception e) {
                data = Result.failure(e.getMessage());
            }
        }
        return data;
    }


}
