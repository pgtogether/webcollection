$(function() {
        $('#loginbtn').click(function () {
            if ($('#usernametxt').val() == "" || $('#pwd').val() == "") {
                alert("用户名或密码不能为空！");
            }
            else {
            	$.ajax({
            		type : "post",
            		data: $("#loginform").serialize(), 
            		url: CONTEXT_PATH+"/doLogin",
            		success : function(json) {
            			if(json.result=="OK"){
            				alert("登录成功");
            			}else{
            				alert("用户名或密码错误！");
            			}
            		},
            		error : function(e) {
            			alert("服务器错误！");
            		}
            	});
            }
        });

   });