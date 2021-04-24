/**
 *
 */
package com.mtons.mblog.modules.template.directive;

import com.mtons.mblog.modules.data.PostVO;
import com.mtons.mblog.modules.entity.Vote;
import com.mtons.mblog.modules.repository.VoteRepository;
import com.mtons.mblog.modules.service.PostService;
import com.mtons.mblog.modules.template.DirectiveHandler;
import com.mtons.mblog.modules.template.TemplateDirective;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 根据作者取产品列表
 *
 * @author langhsu
 *
 */
@Component
public class UserContentsDirective extends TemplateDirective {
    @Autowired
	private PostService postService;

    @Autowired
    private VoteRepository voteRepository;
	@Override
	public String getName() {
		return "user_contents";
	}

    @Override
    public void execute(DirectiveHandler handler) throws Exception {
        long userId = handler.getInteger("userId", 0);
        Pageable pageable = wrapPageable(handler);

        List<Long> postlist = voteRepository.findAllByUserId(userId).stream().map(Vote::getPostId).collect(Collectors.toList());
        Page<PostVO> result = postService.pagingByAuthorId(pageable, userId);

        handler.put(RESULTS, result).render();
    }

}
