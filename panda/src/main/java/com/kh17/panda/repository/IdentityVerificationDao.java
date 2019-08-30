package com.kh17.panda.repository;

import com.kh17.panda.entity.IdentityVerificationDto;

public interface IdentityVerificationDao {

	void insert(String Verification);

	IdentityVerificationDto get(String identity);

	void delete(String identity);

	void clear();






}
