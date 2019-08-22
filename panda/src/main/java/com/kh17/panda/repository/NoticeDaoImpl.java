package com.kh17.panda.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.entity.NoticeDto;
@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("notice.count", param);
	}
	

	@Override
	public List<NoticeDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
		//검색일 때 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", start);
		param.put("end", end);
				
		return sqlSession.selectList("notice.list", param);
	}

	@Override
	public void insertNotice(NoticeDto noticeDto) {
		sqlSession.insert("notice.insertNotice", noticeDto);
	}


	@Override
	public void updateNotice(NoticeDto noticeDto) {
		sqlSession.update("notice.updateNotice", noticeDto);
	}


	@Override
	public void deleteNotice(NoticeDto noticeDto) {
		sqlSession.delete("notice.deleteNotice", noticeDto);
	}


	@Override
	public NoticeDto selectNotice(NoticeDto noticeDto) {
		return sqlSession.selectOne("notice.selectNotice", noticeDto);
	}


	@Override
	public void updateReadCnt(NoticeDto noticeDto) {
		sqlSession.update("notice.updateReadCnt", noticeDto);
	}


	@Override
	public void insertComment(NoticeDto noticeDto) {
		sqlSession.insert("notice.insertComment", noticeDto);
	}


	@Override
	public List<NoticeDto> commentlist(NoticeDto noticeDto) {
		return sqlSession.selectList("notice.commentlist", noticeDto);
	}


	@Override
	public void deleteComment(String deleteComment) {
		Map<String, String> param = new HashMap<>();
		param.put("deleteComment", deleteComment);
		sqlSession.delete("notice.deleteComment", param);
	}

	


}
