<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function () {
	
    //이메일 domain선택 selectBox
    $('#email_addrBox').change(function(){
  		$("#email_addrBox option:selected").each(function () {

 	 //직접입력일 경우
 	 		  if($(this).val()== 'self'){
              $("#email_addr").val('');                             //textBox값 초기화
              $("#email_addr").attr("disabled",false);    //textBox 활성화
              }
  			  else if($(this).val()== 'select'){
              //선택(초기값)일 경우
              $("#email_addr ").val('');                          //textBox값 초기화
              $("#email_addr ").attr("disabled",false); //textBox 활성화
			  }
  			  else{
              $("#email_addr").val($(this).text());      //selectBox에서 선택한 값을 textBox에 입력
              $("#email_addr").attr("disabled",true); //textBox 비활성화
  			  }
 		 });
    });
    $("form").on("submit",function(){
		$("#email").val($("#email_id").val()+"@"+$("#email_addr").val());
    });
});
</script>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원 정보</h1>
	<form action="regist"  method="post">
		<table border="1"  width="80%">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pw" required>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="nick" required>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birth" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="hidden" name="email" id="email" >
						<input type="text" name="email_id" id="email_id" title="이메일 ID" required>@
						<input type="text" name="email_addr" id="email_addr" title="이메일 주소" required>
						<select name="email_addrBox" id="email_addrBox">
							<option value="self">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
						</select>
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td>
						<input type="text" id="post-input" name="post" size="6" maxlength="6" placeholder="우편번호" required>
						<input type="button" onclick="daumPost()" value="우편번호 찾기"> 
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="addr1-input" name="addr1" size="50" placeholder="기본주소" required>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="addr2-input" name="addr2" size="50" placeholder="상세주소" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="가입">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPost() {
        //테마
        var themeObj = {
            bgColor: "#070808", //바탕 배경색
            searchBgColor: "#F5F5F5", //검색창 배경색
            contentBgColor: "#CDF8FA" //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
            //pageBgColor: "", //페이지 배경색
            //textColor: "", //기본 글자색
            //queryTextColor: "", //검색창 글자색
            //postcodeTextColor: "", //우편번호 글자색
            //emphTextColor: "", //강조 글자색
            //outlineColor: "", //테두리
        };
        
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post-input').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1-input').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2-input').focus();
            },
            theme:themeObj,
        }).open();
    }
</script>