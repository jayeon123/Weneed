package com.it.wanted.career.cate.model;

import java.util.List;

public interface CareerCategoryService {

	List<CareerCategoryVO> selectCareerCategoryAll();
	String selectMatchCategoryName(int proCateNo);

}
