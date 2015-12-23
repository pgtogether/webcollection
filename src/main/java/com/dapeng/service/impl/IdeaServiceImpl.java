package com.dapeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.IdeaMapper;
import com.dapeng.domain.Idea;
import com.dapeng.service.IdeaService;
import com.dapeng.service.bo.IdeaBO;

@Service
public class IdeaServiceImpl implements IdeaService {

	@Autowired
	IdeaMapper ideaDao;
	@Override
	public int addUserIdea(IdeaBO ideaBO) {
		Idea idea = new Idea();
		idea.setUserid(ideaBO.getUserid());
		idea.setIdeatitle(ideaBO.getIdeatitle());
		idea.setIdeacontent(ideaBO.getIdeacontent());
		idea.setIdeatime(ideaBO.getIdeatime());
		return ideaDao.addUserIdea(idea);
	}

}
