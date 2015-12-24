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
<%-- <script src="${context_path}/js/recycle.js"></script> --%>
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
			 // $("#recyclelist").append("<li><a href="+json[i].url+">"+json[i].bookmarkname+"</a></li>");
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
		     if($(this).prop("checked"))   
			   {   
			    $(this).removeProp("checked");   
			   }   
			   else  
			   {   
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
				
				/* if(json>0){
					alert("恢复成功");
				}else{
					alert("恢复失败");
				} */
			},
			error : function(e) {
				alert(e);
			
			}
		});
		
		
	});
	 
	 $("#delete").click(function(){
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
			url : "${context_path}/doPhysicsDelBookmark",
			dataType:"json",
			success : function(json) {
				
				for(var i=0;i<json.data.length;i++){
					$("[name='recycledmark']:checked").each(function(){
						if($(this).val()==json.data[i]){
							$(this).parent().remove();
						}
					});
				}
				/* if(json.msg=="OK"){
					alert("删除成功");
				}else{
					alert("删除失败");
				} */
			},
			error : function(e) {
				alert(e);
			
			}
		});
	});

});
	
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
</html>