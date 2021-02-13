package com.it.wanted.matchupCom.model;

import java.util.Map;

public interface MatchupComDAO {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	int checkListedMatchup(String comCode);
	Map<String, Object> isOverMatchup(String comCode);
	MatchupComVO selectMatchupCom(String comCode);
	int updateResumeReadCount(int mcucomNo);
	int checkResumeReadCount(int mcucomNo);

}
