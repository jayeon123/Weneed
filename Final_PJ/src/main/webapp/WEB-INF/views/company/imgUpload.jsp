<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/register.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/imgUpload.css">
<script type="text/javascript">
$(function(){
	$('#tabImg').attr("checked", 'checked');
	
	//[이미지 / 정보] 탭 기능 구현
	$('#tabImg').click(function(){
		$('.infoSection').addClass('hide');
		$('.imgSection').removeClass('hide');
		
		$('#tabImgLabel').addClass('selectedTab');
		$('#tabInfoLabel').removeClass('selectedTab');
		
		
	});
	$('#tabInfo').click(function(){
		$('.imgSection').addClass('hide');
		$('.infoSection').removeClass('hide');
		
		$('#tabInfoLabel').addClass('selectedTab');
		$('#tabImgLabel').removeClass('selectedTab');
	});
});


//이미지 업로드 기능 구현
	const imgFileInput= document.querySelector('#imgFileInput');
	
	$('#comServImgAddBtn').click(function(){
		imgFileInput.click();
	});
</script>
<body>
	<div class="container">
		<!-- 탭 섹션 -->
		<section class="tabSection">
			<input type="radio" id="tabImg" name="comInfoRegi" />
			<label for="tabImg" id="tabImgLabel" class="comInfoRegiTab selectedTab">이미지</label>
			<input type="radio" id="tabInfo" name="comInfoRegi" class="comInfoRegiTab" />
			<label for="tabInfo" id="tabInfoLabel" class="comInfoRegiTab">정보</label>
		</section>
		<!-- 이미지등록 탭 -->
		<section class="imgSection">
			<h2 class="comServTitle">대표 이미지</h2>
			<p class="comServTitle-imageCountGuide">*대표 이미지는 최대 8개까지 등록 가능합니다.</p>
			<div class="imgBoxWrapper">
				<div class="imgBox imgPreviewBox">
					등록된 이미지
				</div>
				<input type="file" id="imgFileInput" class="image_inputType_file" accept="image/*" style="display:none"/>
				<button class="imgBox imgPlusBox" id="comServImgAddBtn"> <!-- 사진 업로드 버튼, 8장 등록되면 숨김처리되도록  -->
					<div class="imgPlusBtn">
						<i class="fas fa-plus fa-3x"></i>
					</div>
					<span class="sizeInfoSpan">1080 X 790 이상</span>
				</button>
			</div>
			<h2 class="comServTitle">로고 이미지</h2>
			<div class="imgBoxWrapper">
				<div class="imgBox">
					
				</div>
			</div>
		</section>
		<!-- 기업정보 수정 탭 -->
		<section class="infoSection hide">
			<h2 class="comServTitle">기업정보 수정</h2>
			<form id="comServInfoModiForm" class="appoinment-form" method="post" action="#">
	           	<div class="row">
	               	<div class="col-lg-6">
	                   	<div class="form-group">
	                    	<span class="comServFormTitle">회사이름</span><span class="comServRequired">*</span>
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	name="comName" id="comName" type="text" class="form-control comServFormInput" placeholder="회사 이름">
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                        <div class="form-group">
	                    		<span class="comServFormTitle">국가</span><span class="comServRequired">*</span>
	                       	<select style="background-color: #ffffff;outline-color: #dbdbdb;" 
	                       	class="form-control comServFormInput" id="nation">
	                           	<option>한국</option>
	                             	<!-- 테이블에서 목록 불러오기 -->
	                           </select>
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    		<span class="comServFormTitle">지역</span><span class="comServRequired">*</span>
	                       	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	class="form-control comServFormInput" id="region">
	                           	<option>서울</option>
	                             	<!-- 테이블에서 목록 불러오기 -->
	                           </select>
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                     <span class="comServFormTitle">대표 주소</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                           name="comAddress" id="comAddress" type="text" class="form-control comServFormInput" placeholder="대표 주소 입력">
	                       </div>
						</div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    	<span class="comServFormTitle">사업자 등록 번호</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                            name="comRegNo" id="comRegNo" type="text" class="form-control comServFormInput" placeholder="'-' 제외 10자리">
	                       </div>
	                    </div>
	                    <div class="col-lg-6 comServ_oneLineDiv">
	                       <div class="form-group">
	                       	   <span class="comServFormTitle">매출액/투자금액</span><span class="comServInfoSentence">(승인기준: 매출액/투자 유치 5억원 이상)</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                            name="profit" id="profit" type="text" class="form-control comServFormInput" placeholder="매출액/투자금액 입력 (단위: 억원)">
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    	<span class="comServFormTitle">산업군</span><span class="comServRequired">*</span>
	                           <select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                           class="form-control comServFormInput" id="industry">
	  		                          <option>산업군</option>
	          	    	              <!-- 테이블에서 목록 불러오기 -->
	              	            </select>
	                       </div>
	                   </div>
	                   <div class="col-lg-6">
	                       <div class="form-group">
	                  		<span class="comServFormTitle">직원수</span><span class="comServInfoSentence">(승인기준: 팀원 10명 이상)</span><span class="comServRequired">*</span>
	                       	 <select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	  id="comSize" class="form-control comServFormInput">
	  		                          <option>회사규모</option>
	          	    	              <!-- 테이블에서 목록 불러오기 -->
	              	            </select>
	                    	</div>
	                    </div>
	                </div>
	                <div class="row">
	                 <div class="col-lg-6 comServ"  style="width:207%">
	                  <div class="form-group">
	                  	<span class="comServFormTitle">회사/서비스 소개</span><span class="comServInfoSentence">(3,000자 제한)</span><span class="comServRequired">*</span>
	                      <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%"
	                      name="comIntro" id="comIntro" class="form-control comServFormInput" rows="6" placeholder="회사 정보 입력"></textarea>
	                  </div>
	                 </div>
	                </div>
	                <div class="row">
					<div class="col-lg-6">
	                   		<div class="form-group">
	                		<span class="comServFormTitle">설립연도</span><span class="comServRequired">*</span>
	                        	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                        	name="comYear" id="comYear" type="text" class="form-control comServFormInput" placeholder="ex) 2012년">
	                    	</div>
	                	</div>
	               		<div class="col-lg-6">
	               		<span class="comServFormTitle">정보 수신 이메일</span><span class="comServRequired">*</span>
	                   	<div class="form-group">
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	name="comEmails" id="comEmails" type="text" class="form-control comServFormInput" placeholder="">
	              			</div>
	               		</div>
	               		<div class="col-lg-6">
	                		<span class="comServFormTitle">담당자 연락처</span><span class="comServRequired">*</span>
	                   	<div class="form-group">
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	 name="comPhone" id="comPhone" type="text" class="form-control comServFormInput" placeholder="">
	                   	</div>
	                	</div>
	                	<div class="col-lg-6">
	                 		<span class="comServFormTitle">웹사이트 주소</span>
	                  		<div class="form-group">
	                       		<input style="background-color: #ffffff;outline-color: #dbdbdb;width:100%"
	                      	 	name="comWebsite" id="comWebsite" type="text" class="form-control comServFormInput" placeholder="URL 입력 (여러개 등록 시 ','로 구분)">
	                   		</div>
	                	</div>
	               	</div>
	             <div class="row">
	                   	<div class="col-lg-6">
	                   	<span class="comServFormTitle">뉴스 검색 키워드</span><span class="comServInfoSentence">(키워드는 최대 3개까지 입력 가능합니다.)</span>
	                       <div class="form-group">
	                           <div style="display:flex;width:207%">
	                             <input style="background-color: #ffffff;outline-color: #dbdbdb;width:180%"
	                             name="comKeywords" id="comKeywords" type="text" class="form-control comServFormInput" placeholder="서비스명 또는 브랜드명 입력">
	                        		<input type="submit" class="form-control comServFormInput" value="추가" style="width:20%">
	                           </div>
	                       </div>
	                   </div>
	                </div>
	                <div class="row">
	                   <div class="col-lg-6" style="display:block;">
	                   	<span class="comServFormTitle">가입 경로</span><span class="comServInfoSentence">(원티드를 추천한 기업과 추천인을 입력해 주세요.)</span>
	                       <div class="form-group">
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;width:207%"
	                            name="comRecom" id="comRecom" type="text" class="form-control comServFormInput" placeholder="ex) 원티드랩/김OO담당자">
	                       </div>
	                   </div>
	                </div>
	                <div class="row">
	                   <div class="col-lg-6">
	                   	<span class="comServFormTitle">기업회원 이용약관</span>
	                       <div class="form-group">
	                           <%-- <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%" rows="6"
	                           name="comMemAgree" id="comMemAgree" type="text" class="form-control comServFormInput" >
	                           <iframe src="<c:url value='/inc2/comServProvision.html'/>"></iframe>
	                           </textarea> --%>
	                           <iframe src="<c:url value='/inc2/comServProvision.html'/>" width="207%" class="comServIFrame comServIFrameModi"></iframe>
	                       </div>
	                   </div>
	                </div>
	                <div class="comServModiSumbitWrapper">
		                <input type="submit" class="btn btn-main btn-round-full btnComServModiSubmit" value="제출하기">
	                </div>
	           </form>
	     </section>
	</div>
</body>
</html>