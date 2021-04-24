package com.mtons.mblog.modules.repository;

import com.mtons.mblog.modules.entity.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: wcy
 * @Date: 2019/12/29
 */
@Repository
public interface VoteRepository extends JpaRepository<Vote, Long>, JpaSpecificationExecutor<Vote> {
    Vote findByUserIdAndPostId(long userId, long postId);
    List<Vote> findAllByPostId(long postId);
    Vote findVoteById(long id);
    List<Vote> findAllByUserId(long userId);
    void deleteByPostId(long postId);

}
