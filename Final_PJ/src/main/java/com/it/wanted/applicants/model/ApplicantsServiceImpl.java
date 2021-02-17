package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.common.SearchVO;

@Service
public class ApplicantsServiceImpl implements ApplicantsService{
	@Autowired
	private ApplicantsDAO applicantsDao;
	
	private static final Logger logger= LoggerFactory.getLogger(ApplicantsServiceImpl.class);
	
//	@Override
//	public List<Map<String, Object>> selectApplicants(String comCode) {
//		return applicantsDao.selectApplicants(comCode);
//	}
//	@Override
//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo) {
//		return applicantsDao.selectApplicants(appliVo);
//	}
	@Override
	public List<Map<String, Object>> selectApplicants(int statusFlag) {
		return applicantsDao.selectApplicants(statusFlag);
	}

	@Override
	public List<ApplicantsVO> selectAllPositions() {
		return applicantsDao.selectAllPositions();
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return applicantsDao.selectTotalRecord(searchVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return applicantsDao.selectByNo(no);
	}

	@Override
	public List<Map<String, Object>> selectApplicants2() {
		return applicantsDao.selectApplicants2();
	}

	/* 자연 */
	@Override
	public int insertApply(ApplicantsVO applyVo) {
		return applicantsDao.insertApply(applyVo);
	}

	@Override
	public List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo) {
		return applicantsDao.selectApplyAllbyAdmin(searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return applicantsDao.selectTotalRecordbyAdmin(searchVo);
	}
	
	/* 가은 */
	@Override
	public int selectApplyComplete(int memNo) {
		return applicantsDao.selectApplyComplete(memNo);
	}

	@Override
	public int selectDocumentPass(int memNo) {
		return applicantsDao.selectDocumentPass(memNo);
	}

	@Override
	public int selectFinalAccept(int memNo) {
		return applicantsDao.selectFinalAccept(memNo);
	}

	@Override
	public int selectFinalFail(int memNo) {
		return applicantsDao.selectFinalFail(memNo);
	}

	@Override
	public int selectApplyTotal(int memNo) {
		return applicantsDao.selectApplyTotal(memNo);
	}

	@Override
	public List<Map<String, Object>> selectApplyList(int memNo) {
		return applicantsDao.selectApplyList(memNo);
	}

//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		// TODO Auto-generated method stub
//		return applicantsDao.updatePeriod(appliVo);
//	}



}
