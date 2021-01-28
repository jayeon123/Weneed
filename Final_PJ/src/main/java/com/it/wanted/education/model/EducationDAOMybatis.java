package com.it.wanted.education.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EducationDAOMybatis implements EducationDAO{
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.education.";

	@Override
	public int insertEdu(EducationVO educationVo) {
		return sqlSession.insert(namespace+"insertEdu",educationVo);
	}

	@Override
	public EducationVO selectEdu(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectEdu",resumeNo);
	}

	@Override
	public List<EducationVO> selectEduByResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectEduByResumeNo", resumeNo);
	}

}