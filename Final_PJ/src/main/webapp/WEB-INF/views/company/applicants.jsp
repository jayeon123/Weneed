<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="apply"
	class="com.it.wanted.applicants.model.ApplicantsVO" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/companyService/applicants.css'/>">

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#rd-appliPassedFilter_new').attr('checked', 'checked');

		//리스트 아이템을 누르면 addClass removeClass를 반복한다. 이거 함수로 만들어볼깡
		$('.appli-li-filter').click(
				function() {
					const num = $('.appli-li-filter').index($(this));
					//선택한 (바뀔) 탭메뉴의 인덱스를 가져온다
					$('.lb-appliPassedFilter').removeClass(
							"lb-appliPassedFilter-selected");
					//전체 리스트에 대해 셀렉티드 클래스 제거
					$('.lb-appliPassedFilter:eq(' + num + ')').addClass(
							"lb-appliPassedFilter-selected");
					//선택한 탭메뉴 인덱스에 클래스 추가
				});

		
		

	});
	
	function pageFunc(curPage, statusflag){
		$('input[name=statusflag]').val(statusflag);
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	function favoFunc(){
		$("#favo").css("color","gold");
	}
	
	
	/* //서류통과 클릭 시
	$('input:radio[name=rd-appliPassedFilter_doc]').is(':checked'){
		alret();
	}
 	*/
	
</script>
<body>
	<form
		action="<c:url value='/company/applicants.do?'/>"
		name="frmPage" method="post"><!--  style="display: none;" -->
		<input type="text" name="currentPage"> 
		<input type="text" name="searchCondition" value="${param.searchCondition }"> 
		<input
			type="text" name="searchKeyword" value="${param.searchKeyword }">
		<input type="text" name="statusflag">
	</form>

	<div class="container">
		<div class="appli-wrapper">
			<aside>
				<!-- 해당 기업코드로 등록된 포지션들의 직군코드를 불러와 리스트에 뿌려줘야 함 -->
				<div class="appli-positionList">
					<h5 class="appli-positionList-title"
						style="color: #acacac; font-weight: bold; padding-bottom: 3px">채용중</h5>
					<!-- <ul style="font-size: 0.8em; "> -->
					<p class="appli-positionList-pos appli-positionList-pos_selected"
						style="font-size: 12px;">
						전체 포지션
						<c:if test="${!empty posList}">
							<c:forEach var="pList" items="${posList}">
								<p class="appli-positionList-pos " style="font-size: 12px;">
									<c:out value="${pList.posName }"></c:out>
							</c:forEach>
						</c:if>
				</div>
				<div class="appli-positionList appli-positionList-closed">
					<h5 class="appli-positionList-title"
						style="color: #acacac; font-weight: bold;">종료</h5>
				</div>
			</aside>
			<div>
				<!-- contents 영역 -->
				<section>
					<!-- 상단 응답률 / 안내문구 섹션 -->
					<div>
						<!-- 정보 조회성 영역 -->
						<div class="appli-responseInfo">
							<div class="appli-responseInfo_obj">
								<span class="appli-span-allResponse">전체 응답률</span>&nbsp; <strong
									class="appli-bigNumber-blue">95.0%</strong>
							</div>
							<div class="appli-responseInfo_obj">
								<span>응답 지연</span>&nbsp; <strong class="appli-bigNumber-red">0명</strong>
							</div>
						</div>
						<div>
							<p class="appli-notiGuide">지원자에게 15일 안에 합격/불합격 소식을 알려주세요. 좋은
								후보자는 여러 곳에서 제안을 받습니다. 타이밍을 놓치지 마세요.</p>
						</div>
					</div>
				</section>
				<section>
					<!-- 라디오버튼 선택 시 flag에 따른 리스트 노출 섹션-->
					<div class="appli-filterNsearch">
						<!-- 라디오버튼 필터 / 검색창 -->
						<div>

							<!-- <script>
									$(function() {
										if($('input:radio[name="rd-appliPassedFilter"]:checked').length < 1){
										    alert('카테고리를 선택해주세요');                        
										}
										
										if(radioVal == 1) {
												$.ajax({
													url:"<c:url value='/company/statusCheck.do'/>",
													type:"GET",
													data:"statusFlag=" + radioVal ,
													dataType:"json",
													success:function(list){
													
														alert(list);
														
													},
													error:function(xhr, status, error){
														alert("error!! : " + error);
													}
									});
								</script> -->
							<!-- 라디오버튼 필터 -->
							<ul class="appli-ul-filter">
								<!-- 클릭하면, 스타일 바뀌게 해야함 -->

								<!-- checked="checked" -->
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_doc">
									<label for="rd-appliPassedFilter_new"
									class="lb-appliPassedFilter lb-appliPassedFilter-selected">
										<a href='<c:url value="/company/applicants.do?statusFlag=0"/>'">신규
											(0)</a>
								</label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_doc">
									<label for="rd-appliPassedFilter_doc"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=${1 }"/>'>서류통과
											(0)</a></label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_passed">
									<label for="rd-appliPassedFilter_passed"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=2"/>'>최종합격
											(0)</a> </label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_rejected">
									<label for="rd-appliPassedFilter_rejected"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=3"/>'>불합격
											(0) </a> </label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_timeout">
									<label for="rd-appliPassedFilter_timeout"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=4"/>'>기간만료
											(0)</a> </label></li>
							</ul>
						</div>
						<div class="appli-searchDiv">
							<form name="frmSearch" method="post"
								action='<c:url value="/company/applicants.do"/>'>
								<!-- 검색창 -->
								<input type="text" placeholder="지원자, 포지션 검색"
									value="${param.searchKeyword }" name="searchKeyword"
									class="appli-searchInput" style="height: 33px;"> <input
									type="submit" class="appli-btn-statusChange"
									style="outline: none;" value="검색">
							</form>
						</div>
					</div>

					<div class="appli-statusChangeDiv">
						<!-- 체크올, 상태변경, 지원자에게 결과를  알림 on/off, 별표지원자 모아보기 상태변경팝업도 띄워야겠네ㅋㅋ  -->
						<div class="appli-statusChangeDiv">
							<!-- 체크, 상태변경, 지원자에게 결과알림 -->
							<div class="appli-statusChangeDiv">

								<input type="checkbox" class="appli-checkAll"
									id="appli-checkAll"><label for="appli-checkAll"></label>
								<script>
									$(function() {
										$('#appli-checkAll').click(function() {
											var chkAll = $('#appli-checkAll').prop('checked');
											
											if(chkAll){
												$('#chBox').prop("checked", true);
											}else{
												$('#chBox').prop("checked", false);
											}
										});
									});
								</script>

								<button class="appli-btn-statusChange" data-toggle="modal"
									data-target=".comServAppliStatusChangeMD"
									style="outline: none;">상태변경</button>
								<!-- 상태변경 모달 include -->
								<%@ include file="../company/modal/statusChange.jsp"%>
							</div>
						</div>
						<div>
							<!-- 별표 지원자 모아보기 -->
							<input type="checkbox" id="chkBox-staredApplis"> <label
								for="chkBox-staredApplis" class="chkBox-staredApplis">별표
								지원자 모아보기</label>
						</div>
					</div>
					<div>
						<!-- 리스트 뿌리기.. 디비에서 읽어온걸로, 틀만 잡아주어봅시다 -->
						<!-- 리스트에 값 없을 때 -->
						<c:if test="${empty aList}">
							<div class="appli-list-object-none">
								<p>아직 지원자가 없습니다.</p>
							</div>
						</c:if>

						<!-- 리스트에 값 있을 때, 1개 객체  -->
						<c:if test="${!empty aList}">
							<c:forEach var="aVo" items="${aList}">
								<%-- <c:set target="${aVo}" property="SatusFlag" value="${aVo['STATUS_FLAG']}" /> --%>
								<c:set var="StatusFlag" value="#{aVo.statusFlag }"></c:set>
								<c:set target="${aVo }" property="statusFlag" value="${aVo['STATUS_FLAG']}"/>
 								<%-- <c:set value="${aVo['STATUS_FLAG']}" var="SatusFlag"/> --%>

								<div class="appli-list-object">
									<div class="appli-list-object_info">
										<div>
											<input type="checkbox"
												class="appli-object-ele appli-object-ele-chk" id="chBox"
												name="chBox"> <i
												class="fas fa-star appli-object-ele appli-object-ele_gold"
												id="favo+${aVo.applyNo}" onclick="favoFunc()"></i>

											<script>
												$('#chBox').click(function(){
													$('#appli-checkAll').prop("checked",false);
												});
											</script>

										</div>
										<div class="appli-list-object_infoResume appli-object-ele">
											<div class="appli-list-object_infoResumeImg">
												<i class="fas fa-user"></i>
											</div>
											<div>
												<p class="appli-resume-no">No. ${aVo['APPLY_NO'] }</p>
												<p class="appli-name-posJikgun">
													<a
														href="<c:url value='/company/applicantsDetail.do?no=${aVo["APPLY_NO"]}'/>">
														${aVo['APPLY_NAME'] } · ${aVo['POS_NAME'] }</a>
												</p>
											</div>
										</div>
									</div>
									<div>
										<%-- <fmt:formatDate value="${now }" pattern="yyMMddHHmmss"
											var="nowtime" />
										<fmt:parseNumber value="${now.time/(1000*60*60*24) }"
											integerOnly="true" var="nowDate" scope="request"></fmt:parseNumber>
										<fmt:parseNumber
											value="${(aVo['APPLY_REGDATE']).time/(1000*60*60*24) }"
											integerOnly="true" var="aRegdate" scope="page"></fmt:parseNumber>
										<c:set value="${nowDate-aRegdate }" var="dateDiff"></c:set>
										<i class="far fa-clock"></i><span class="appli-waitingDays">
											
											<c:out value="${dateDiff}"></c:out> 일째 기다림
										</span>  --%>

										<i class="far fa-clock"></i><span class="appli-waitingDays">
											<c:if test="${aVo['APPLY_PERIOD']>=0 }">
												${aVo['APPLY_PERIOD'] } 일째 기다림 ${StatusFlag }
											</c:if>
										</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

					<div class="appli-paging-divs" style="justify-content: center;">
						
							<c:if test="${pagingInfo.firstPage>1 }">
								<div class="appli-paging-div appli-paging-div_prev">
									<button onclick="pageFunc(${pagingInfo.firstPage-1}, ${StatusFlag})">이전</button>
								</div>
							</c:if>

							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage}"
								end="${pagingInfo.lastPage}">
								<c:if test="${i==pagingInfo.currentPage }">
									<div class="appli-paging-div appli-paging-div_page"
										style="margin: 0px 3px;">
										<button style="font-weight: bold">${i}</button>
									</div>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<div class="appli-paging-div appli-paging-div_page"
										style="margin: 0px 3px;">
										<button onclick="pageFunc(${i},${StatusFlag})">${i}</button>
									</div>
								</c:if>
							</c:forEach>

							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
								<div class="appli-paging-div appli-paging-div_next">
									<button onclick="pageFunc(${pagingInfo.lastPage+1},${StatusFlag}>)">다음</button>
								</div>
							</c:if>
							<!--  페이지 번호 끝 -->
						
					</div>



				</section>
				<!-- 페이징 처리 -->
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>