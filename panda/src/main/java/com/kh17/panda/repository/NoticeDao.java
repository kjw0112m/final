package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.NoticeDto;

public interface NoticeDao {
	int count(String type, String keyword);
	List<NoticeDto> list(String type, String keyword, int start, int end);
	void insertNotice(NoticeDto noticeDto);
	void updateNotice(NoticeDto noticeDto);
	void deleteNotice(NoticeDto noticeDto);
	void updateReadCnt(NoticeDto noticeDto);
	void insertComment(NoticeDto noticeDto);
	void deleteComment(String deleteComment);
	List<NoticeDto> commentlist(NoticeDto noticeDto);
	NoticeDto selectNotice(NoticeDto noticeDto);
}
