package com.kh17.panda.repository;

import com.kh17.panda.entity.FilesDto;

public interface FilesDao {
	int getSequenceNumber();
	void insert(FilesDto filesDto);
	FilesDto get(int id);
	String getSaveName(int mainfile);
	void delete(int mainfile);
}
