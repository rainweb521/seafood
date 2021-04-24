package com.mtons.mblog.modules.service.impl;

import com.mtons.mblog.modules.data.FavoriteVO;
import com.mtons.mblog.modules.data.PostVO;
import com.mtons.mblog.modules.entity.Vote;
import com.mtons.mblog.modules.repository.FavoriteRepository;
import com.mtons.mblog.base.utils.BeanMapUtils;
import com.mtons.mblog.modules.entity.Favorite;
import com.mtons.mblog.modules.repository.VoteRepository;
import com.mtons.mblog.modules.service.FavoriteService;
import com.mtons.mblog.modules.service.PostService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author langhsu on 2015/8/31.
 */
@Slf4j
@Service
@Transactional(readOnly = true)
public class FavoriteServiceImpl implements FavoriteService {
    @Autowired
    private FavoriteRepository favoriteRepository;
    @Autowired
    private PostService postService;
    @Autowired
    private VoteRepository voteRepository;

    @Override
    public Page<FavoriteVO> pagingByUserId(Pageable pageable, long userId) {
        Page<Favorite> page = favoriteRepository.findAllByUserId(pageable, userId);

        List<FavoriteVO> rets = new ArrayList<>();
        Set<Long> postIds = new HashSet<>();
        for (Favorite po : page.getContent()) {
            rets.add(BeanMapUtils.copy(po));
            postIds.add(po.getPostId());
        }

        if (postIds.size() > 0) {
            Map<Long, PostVO> posts = postService.findMapByIds(postIds);

            for (FavoriteVO t : rets) {
                PostVO p = posts.get(t.getPostId());
                t.setPost(p);
            }
        }
        return new PageImpl<>(rets, pageable, page.getTotalElements());
    }

    @Override
    @Transactional
    public void add(long userId, long postId) {
        Favorite po = favoriteRepository.findByUserIdAndPostId(userId, postId);

        Assert.isNull(po, "您已经收藏过此产品");

        // 如果没有喜欢过, 则添加记录
        po = new Favorite();
        po.setUserId(userId);
        po.setPostId(postId);
        po.setCreated(new Date());

        favoriteRepository.save(po);
    }

    @Override
    @Transactional
    public void delete(long userId, long postId) {
        Favorite po = favoriteRepository.findByUserIdAndPostId(userId, postId);
        Assert.notNull(po, "还没有喜欢过此产品");
        favoriteRepository.delete(po);
    }

    @Override
    @Transactional
    public void deleteByPostId(long postId) {
        int rows = favoriteRepository.deleteByPostId(postId);
        log.info("favoriteRepository delete {}", rows);
    }

    @Override
    public void addvote(long userId, long postId) {
        Vote vo = voteRepository.findByUserIdAndPostId(userId, postId);
        Assert.isNull(vo, "您已经预购该产品了");

        // 如果没有喜欢过, 则添加记录

        LocalDateTime now = LocalDateTime.now();
        String timeStr = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now);
        Vote vote = new Vote();
        vote.setCreate_date(timeStr);
        vote.setNum(0);
        vote.setPostId(postId);
        vote.setStatus(0);
        vote.setStatus_str("已预购");
        vote.setUserId(userId);
        voteRepository.save(vote);
    }

}
