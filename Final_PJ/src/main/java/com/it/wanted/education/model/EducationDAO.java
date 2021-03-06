package com.it.wanted.education.model;

import java.util.List;

public interface EducationDAO {
	public int insertEdu(EducationVO educationVo);
	public EducationVO selectEdu(int resumeNo);
	public int deleteEdu(int eduNo);
	public int updateEdu(EducationVO educationVo);
	public List<EducationVO> selectEdubyResumeNo(int resumeNo);
	public int insertMcuEdu(EducationVO educationVo);
	public EducationVO selectEduOne(int eduNo);
	public int updateEduName(EducationVO eduVo);
	/* 현빈 */
	public List<Integer> selectMcumemNo(String searchKeyword);
}
