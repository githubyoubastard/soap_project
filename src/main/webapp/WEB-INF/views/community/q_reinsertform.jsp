<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Qinsertfomr.jsp</title>
<style>
#insertform {
	width: 70%;
	margin: 0 auto;
	font-size: 1.5rem;
}

#insertform .innerdiv {
	margin-top: 20px;
}

#contentWrap {
	position: absolute;
	right: 0;
	left: 6%;
	width: 95%;
	height: 100%;
}

#contentTitle .heading {
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 4rem;
	border-bottom: 1px solid #000;
}

#contentTitle .heading a {
	font-size: 3rem;
	color: #53b5aa;
}

#contentTitle a:hover {
	font-size: 3rem;
	color: #2d998c;
	transition: all .3s;
}

#contentTitle .com_content {
	padding-top: 7%;
	width: 70%;
	margin: 0 auto;
	font-size: 2rem;
}

#contentTitle .table {
	font-size: 1.5rem;
}
</style>
<script
	src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>

<jsp:include page="../index/loading.jsp" />
</head>
<body>
	<jsp:include page="../index/header.jsp" />

	<div id="contentWrap">
		<div id="contentTitle">
			<p class="heading">
				COMMUNITY <span><a
					href="${pageContext.request.contextPath }/community/n_list.do">NEWS</a></span>
				<span><a
					href="${pageContext.request.contextPath }/community/q_list.do">Q&A</a></span>
			</p>
			<div class="com_content">

				<div>
					<label>Q&A</label>

					<div row>
						<p class="info">궁금하신 점이 있으면 자유롭게 물어보세요</p>
						<!-- insert form -->
						<form id="insertform" action="q_insert.do">

							<div class="col-xs-4 innerdiv">
								<label for="writer">writer</label><br /> <input
									class="form-control" type="text" id="writer" value="${id }"
									disabled="disabled" />
							</div>
							<div class="col-xs-8 innerdiv">
								<label for="title">title</label> <br /> <input
									class="form-control" placeholder="title here..."
									class="col-xs-12" type="text" name="title" id="title" /><br />
							</div>

							<textarea name="content" id="content"
								style="width: 100%; height: 412px; display: none"></textarea>


							<div class="col-xs-6 innerdiv">
								<label for="passwdok">비밀번호를 입력해주세요</label>
								<!--<input  type="checkbox" name="passwdok" id="passwdok"/>-->
								<input placeholder="password here..."
									class="form-control col-xs-4" type="password" id="passwd"
									name="passwd" />
							</div>
							<div class="col-xs-6 ">
								<button style="width: 40%;" onclick="submitContents(this);">send</button>
							</div>

						</form>
						<!-- /insert form -->
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
		var oEditors = [];

		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "content",
					sSkinURI : "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",
					htParams : {
						bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
						fOnBeforeUnload : function() {
							//alert("완료!");
						}
					}, //boolean
					fOnAppLoad : function() {
						//예제 코드
						//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
					},
					fCreator : "createSEditor2"
				});

		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		// 비밀글 체크 이벤트 발생할 경우
		// 비밀글 체크에 따른 input open 여부
		/*
		var pwdInput=false;
		console.log("pwdInput : "+pwdInput);
		$("#passwdok").change(function(){
			console.log("클리끄");
			if(pwdInput){
				$("#passwd").hide();
				pwdInput=false;
				console.log("pwdInput : "+pwdInput);
			} else{ // false인 상태에서 클릭한 경우 보여주기
				$("#passwd").show();
				pwdInput=true;
				console.log("pwdInput : "+pwdInput);
			}
		})
		 */
	</script>
</body>
</html>