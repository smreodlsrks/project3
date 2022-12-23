<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서울특별시교육청 > 회원유형확인 > 이용약관동의 > 본인확인 > 정보입력</title>
    <script src="../Common/jquery-3.6.1.js"></script>
    <style>
        *{font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 12px;margin: 0px auto;}
        form{margin-top: 20px;}
        input, select, button {border: 1px solid #afafaf;}
        input.userInput{padding:3px 2px;}
        select.userSelect{padding:2px 0;}
        .c_imp{color: red;}
        .userTable{border: none; border-collapse: collapse; width: 670px;}
        .userTable td{padding:10px; border: 1px solid #b9babb;}
        .userTable td.userTit{background-color: #E4E6E9; font-weight: bold;}
        .btn_search{background-color: #3d3d3d; color: #ffffff; width: 70px; height: 23px; padding:1px 0 2px;}
        .btn_search:hover{background-color: #6d6d6d;}        
        .btn_submit{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #E70E16;color:white;font-size: 14px;}
        .btn_cancel{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #464646;color:white;font-size: 14px;}
        .w20{width:20px;} .w30{width:30px;} .w40{width:40px;} .w50{width:50px;} .w100{width:100px;} 
        .w300{width:300px;} .w510{width:510px;} .w410{width:410px;} 
        #id_loading{position:absolute;top:530px;z-index:10;width:100%;text-align:center;display:block;}
    </style>
    <script>
    	/* function cfDuple(){
    		var idStr = $("#id").val();
    		$.ajax({
    			url : "CfDuple?id=" + idStr,
    			success : function(data){
    				if(data == "successs"){
    					$("#result").text("사용가능한 아이디입니다.");
    				} else if(data == "fail") {
    					$("#result").text("중복된 아이디입니다.");
    				}
    			}
    		});
    	} */
    	
    	function duplication(frm){
    		frm.id.readOnly = true;
    		open("./Duplication.jsp?id="+frm.id.value,
    			"duplication",
    			"width=385, height=240, left=1000, top=150, "
    		     + "location=no, toolbar=no, menubar=no, "
    		     + "scrollbars=yes, resize=no");				
    	}
    	
    	function reconfirm(frm){
    		frm.idx.checked = false;
    	}
    	
        function formValidate(frm){            
            if(frm.id.value==''){            	
                alert("아이디를 입력하세요.");
                frm.id.focus();
                return false;
            }

            if(frm.password.value=='' || frm.pwConfirm.value==''){
                alert("비밀번호를 입력하세요.");
                frm.password.value = "";
                frm.pwConfirm.value = "";
                frm.password.focus();
                return false;
            }else if(frm.password.value != frm.pwConfirm.value){
                alert("비밀번호와 확인값이 일치하지 않습니다.");
                frm.password.value = "";
                frm.pwConfirm.value = "";
                frm.password.focus();
                return false;
            }

            if(frm.name.value==""){
                alert("이름을 입력하세요.");
                frm.name.focus();
                return false;
            }

            if(frm.email1.value=="" || frm.email2.value==""){
                alert("이메일을 입력하세요.");
                frm.email1.focus();
                return false;
            }
            if(frm.email_domain.value != ""){
                frm.email2.value == frm.email_domain.value;
            }
                        
            if(!(frm.mobile1.value.length==3 && frm.mobile2.value.length==4 && frm.mobile3.value.length==4)){
                alert("올바른 휴대전화 번호를 입력하세요.");
                return false;
            }  
           
            if(frm.quiz.value==""){
                alert("질문을 선택하세요.");
                return false;
            }            
            
            if(frm.answer.value==""){
                alert("답변을 작성하세요.");
                return false;
            }
            
            if(frm.idx.checked==false){
            	alert("아이디 중복검사를 하세요.")
            	return false;
            }
        }
        
        function emailPut(frm){            
            if(frm.email_domain.value=="직접입력"){
                frm.email2.value = "";                
                frm.email2.readonly = false;                
            }
            else{
                frm.email2.value = frm.email_domain.value;
                frm.email2.readonly = true;            
            }
        }
        
        function quizPut(frm){            
            if(frm.quiz.value != ""){
                frm.answer.readOnly = false;                
            }
            else{
            	frm.answer.value = "";
                frm.answer.readOnly = true;            
            }
        }
        
        function comfotable(idx, lengthx, next){
        	if(document.getElementById(idx).value.length == lengthx)
        		document.getElementById(next).focus();
        }
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
         function postOpen(){
            new daum.Postcode({
                oncomplete: function(data) {
                console.log(data.zonecode, data.address);
                var f = document.myform;
                f.zipcode.value = data.zonecode;
                f.addr1.value = data.address;
                f.addr2.focus();
                }
            }).open();
        }
    </script>
</head>
<body>
	<img src="../Images/sign4-1.png" />
	<img src="../Images/sign4-2.png" style="background-color:rgb(141, 180, 213);" />
    <form name="myform" action="MembershipProcess.jsp" method="post" onsubmit="return formValidate(this);">
        <table class="userTable">
            <colgroup>
                <col width="130px" />
                <col width="540px" />
            </colgroup>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 아이디</td>
                <td class="userVal">
                    <input type="text" id="id" name="id" value="" maxlength="15" class="userInput"
                        style="width:120px;" onKeyPress="reconfirm(this.form)" />
                    <input type="checkbox" id="idx" name="idx" value="" style="display:none;" />
                    <button type="button" class="btn_search" style="cursor:pointer;" onClick="duplication(this.form)">중복확인</button>                      
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 비밀번호</td>
                <td class="userVal">
                    <input type="password" name="password" value="" style="width:100px;" class="userInput"
                        maxlength="25" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 비밀번호 확인</td>
                <td class="userVal">
                    <input type="password" name="pwConfirm" value="" style="width:100px;" class="userInput"
                        maxlength="25" />
                    <span style="margin:0 0 0 3px; color:#888888;">(확인을 위해 다시 입력해 주세요.)</span>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 이름</td>
                <td class="userVal">
                    <input type="text" name="name" value="" style="width:120px;" class="userInput" maxlength="10" />
                </td>
            </tr>
            <tr>
	            <td class="userTit" style="height:23px;"><span style="margin-left:10px;"></span> 성별</td>
	            <td class="userVal">
	            	<label><input type="radio" name="sex" value="male" />남자</label>
                    <label><input type="radio" name="sex" value="female" />여자</label>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span style="margin-left:10px;"></span> 생년월일</td>
                <td class="userVal">
                    <input type="text" id="b1" name="birth1" value="" class="userInput w40" maxlength="4" onkeyup="comfotable('b1', 4, 'b2')" /><span style="margin:0 5px 0 1px;">년</span>
                    <input type="text" id="b2" name="birth2" value="" class="userInput w20" maxlength="2" onkeyup="comfotable('b2', 2, 'b3')" /><span style="margin:0 5px 0 1px;">월</span>
                    <input type="text" id="b3" name="birth3" value="" class="userInput w20"maxlength="2" /><span style="margin:0 15px 0 1px;">일</span>
                    <span style="margin:0 0 0 3px;color:#888888;">(예 : 2000년 01월 31일)</span>
                </td>
            </tr>
            <tr>
                <td class="userTit" rowspan="2"><span class="c_imp">*</span> 이메일</td>
                <td class="userVal">
                    <input type="text" name="email1" value="" class="userInput w100" />
                    <span style="font-size:16px;">＠</span>
                    <input type="text" name="email2" value="" class="userInput w100" />
                    <select name="email_domain" onchange="emailPut(this.form);" class="userSelect w100">
                        <option value=""> -- 선택 -- </option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="직접입력" selected>직접입력</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="userVal" style="height:0px; color:#888888;">
                	※ hanmail.net은 메일 수신이 어려울 수 있으니 가급적 다른 메일을 이용하시기 바랍니다.
                </td>
            </tr>
            <tr>
                <td class="userTit" rowspan="3"><span style="margin-left:10px;"></span> 주소</td>
                <td class="userVal">
                    <button type="button" class="btn_search" style="cursor:pointer;" onClick="postOpen();">주소찾기</button>
                    <input type="text" name="zipcode" maxlength="10" value="" class="userInput w50" readOnly /> (우편번호)
                </td>
            </tr>
            <tr>
                <td class="userVal">
                    <input type="text" name="addr1" class="userInput w510" maxlength="100" value="" readOnly/>
                </td>
            </tr>
            <tr>
                <td class="userVal">
                    <input type="text" name="addr2" class="userInput w410" maxlength="100" value="" />
                    <span style="margin-left:10px;"></span>
                    + 나머지 주소
                </td>
            </tr>
            <tr>
                <td class="userTit"><span style="margin-left:10px;"></span> 전화번호</td>
                <td class="userVal">
                    <input type="text" id="p1" name="phone1" value="" class="userInput w30" maxlength="3" onkeyup="comfotable('p1', 3, 'p2')" /> -
                    <input type="text" id="p2" name="phone2" value="" class="userInput w40" maxlength="4" onkeyup="comfotable('p2', 4, 'p3')" /> -
                    <input type="text" id="p3" name="phone3" value="" class="userInput w40" maxlength="4" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 휴대전화</td>
                <td class="userVal">
                    <input type="text" id="m1" name="mobile1" value="" class="userInput w30" maxlength="3" onkeyup="comfotable('m1', 3, 'm2')" /> -
                    <input type="text" id="m2" name="mobile2" value="" class="userInput w40" maxlength="4" onkeyup="comfotable('m2', 4, 'm3')" /> -
                    <input type="text" id="m3" name="mobile3" value="" class="userInput w40" maxlength="4" />
                    <span style="margin-left:20px;"></span>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 비밀번호 찾기 </td>
                <td class="userVal" style="padding:3px 0 3px 10px;">
                    <select name="quiz" class="userSelect w200" onchange="quizPut(this.form);">
                        <option value="">:: 비밀번호 찾기 ::</option>
                        <option value="내가 졸업한 초등학교 이름은?">내가 졸업한 초등학교 이름은?</option>
                        <option value="내가 가장 감명 깊게 읽은 책은?">내가 가장 감명 깊게 읽은 책은?</option>
                        <option value="내가 키우는 애완동물의 이름은?">내가 키우는 애완동물의 이름은?</option>
                        <option value="내가 가장 좋아하는 과일은?">내가 가장 좋아하는 과일은?</option>
                    </select>
                    <input type="text" name="answer" size="40" readonly />
                </td>
            </tr>
        </table>
        <table style="width:670px; margin-top:20px;">
            <tr>
                <td align="center">                    
                    <input type="submit" value="등록하기" class="btn_submit" />
                    &nbsp;&nbsp;
                    <input type="reset" value="새로쓰기" class="btn_cancel" />
                </td>
            </tr>
        </table>       
    </form>
    <br /><br />
</body>
</html>