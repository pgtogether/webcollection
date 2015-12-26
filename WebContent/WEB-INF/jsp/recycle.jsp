<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回收站</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="js/operate.js"></script>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/operate.css" rel="stylesheet"
	type="text/css" />
</head>
<script>
$(function() {
	
	$.ajax({
		type : "post",
		url : "${context_path}/doSelectRecycleBookmarkList",
		dataType:"json",
		success : function(json) {
			 var no;
			 var url;
			 var name;
			 for(var count=0;count<json.data.length;count++){  
			 	no = json.data[count].i;
			  	url = json.data[count].u;
			  	name = json.data[count].n;
			  	$("#recyclelist").append('<div id="'+no+'"><label><input name="recycledmark" type="checkbox" value="'+no+'" />'+'<a href="'+url+'">'+name+'</a>'+'</label></div>'+'<br>');
			 }    
		},
		error : function(e) {
			alert(e);
		}
	});
	 $("#btn1").click(function(){
	    	$("[name='recycledmark']").prop("checked",'true');//全选   
	    });  
		
	    $("#btn2").click(function(){
	   	 	$("[name='recycledmark']").removeProp("checked");//取消全选   
	    });
	    
	    
	    $("#btn4").click(function(){   
		    $("[name='recycledmark']").each(function(){   
		     if($(this).prop("checked")){   
			    $(this).removeProp("checked");   
			   }   
			   else{   
			    $(this).prop("checked",'true');   
			   }   
	    	}
		    );}
	    );
	
	
	 //恢复
	 $("#back").click(function(){
		 var str = "";
		$("[name='recycledmark']:checked").each(function(){

			str+=$(this).val()+";";    
		});
		//alert(str);
		if(str==""){
			return;
		}
		$.ajax({
			data:'bookmarkno='+str,
			type : "post",
			url : "${context_path}/doRecoverBookmark",
			success : function(json) {
				for(var i=0;i<json.data.length;i++){
					$("[name='recycledmark']:checked").each(function(){
						if($(this).val()==json.data[i]){
							$(this).parent().remove();
						}
					});
				}
			},
			error : function(e) {
				alert(e);
			
			}
		});
		
		
	});
	 
	 var bmstr = "";
	 $("#delete").click(function(){
		 	if(bmstr!=""){
		 		bmstr = "";
		 	}
		 	$("[name='recycledmark']:checked").each(function(){
				
				bmstr+=$(this).val()+";";    
			});
			if(bmstr==""){
				 $(".popbox-for-alert").show();
				 $(".popbox-for-alert .tipmsg > span").text("请至少选择一项");
				 return;
			}
		 $(".popbox-for-confirm").show();
		 $(".popbox-for-confirm .tipmsg >span").text("确定永久删除所选书签吗？");
	  });
	 
	$(".popbox-for-confirm .tip-confirm-btn").click(function(){
		 
			$.ajax({
				data:'bookmarkno='+ bmstr,
				type : "post",
				url : "${context_path}/doPhysicsDelBookmark",
				dataType:"json",
				success : function(json) {
					if(json.result == "OK"){
						for(var i=0;i<json.data.length;i++){
							$("[name='recycledmark']:checked").each(function(){
								if($(this).val()==json.data[i]){
									$(this).parent().remove();
								}
							});
						} 
						 $(".popbox-for-confirm").hide();
						 saveSuccessAnimate("删除成功");
					}
				},
				error : function(e) {
					saveErrorAnimate("删除失败");
				}
			}); 
	 });
	 
 	  $(".popbox-for-confirm .tip-cancel-btn").click(function(){
 		 $(".popbox-for-confirm").hide();
	 }); 
 	  
	  $(".popbox-for-alert .tip-confirm-btn").click(function(){
	 		 $(".popbox-for-alert").hide();
		 }); 

});

	function saveSuccessAnimate(msg){
		var $popCallBack = $(".pop-callback-success");
		$popCallBack.find(".callbackmsg").html(msg);
		$popCallBack.animate({
			top : "10px",
			opacity : 1
		}, 800, function() {
			$(this).delay(800).animate({
				top : "-350px",
				opacity : 0.3
			}, 500);
		});
	}
	
	function saveErrorAnimate(msg){
		var $popCallBack = $(".pop-callback-error");
		$popCallBack.find(".callbackmsg").html(msg);
		$popCallBack.animate({
			top : "5px",
			opacity : 1
		}, 800, function() {
			$(this).delay(800).animate({
				top : "-350px",
				opacity : 0.3
			}, 500);
		});
	}
	

	
</script>
<body>
	回收站<br />
   <input type="button" id="back" value="恢复所选"></input>
   <input type="button" id="delete" value="删除所选"></input>
<form id="recyclelist">
 	<input type="button" id="btn1" value="全选">    
   <input type="button" id="btn2" value="取消全选">     
   <input type="button" id="btn4" value="反选">     
   <br/>
</form>
</body>
<jsp:include page="pop.jsp" />
<jsp:include page="templates.jsp" />
<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
<jsp:include page="/js/dynamic/common.js.jsp"></jsp:include>
</html>