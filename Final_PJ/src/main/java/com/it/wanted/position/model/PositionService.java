package com.it.wanted.position.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface PositionService {

	int insertPosition(PositionVO posVo, List<String> jikmus);
	
	/* 현빈 0214 */
	List<Map<String, Object>> selectJobsearchList();
	List<PositionVO> selectPositionByComcode(String comCode);

	/* 0216자연 */
	public List<Map<String, Object>> selectPositionAllbyAdmin(SearchVO searchVo);
	public int selectTotalRecordbyAdmin(SearchVO searchVo);

	/* 0217현빈 */
	List<Map<String, Object>> selectAllYetPosition(SearchVO searchVo);
	int selectYetTotalRecord();
	List<Map<String, Object>> selectAllPassedPosition(SearchVO searchVo2);
	int selectPassedTotalRecord();
	int changeStatustoPass(List<Integer> posNoList);

}
