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
	

	 $("#btn1").click(function(){
	    	$("[name='recycledmark']").prop("checked",'true');//全选   
	    });  
		
	    $("#btn2").click(function(){
	   	 	$("[name='recycledmark']").removeProp("checked");//取消全选   
	    });
	    
	    $("#btn3").click(function(){   
	        
	    $("[name='recycledmark']:even").prop("checked",'true');//选中所有奇数   
	     
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
	
	$.ajax({
		type : "post",
		url : "${context_path}/doSelectRecycleBookmarkList",
		dataType:"json",
		success : function(json) {
			var id;
			var url;
			 var name;
			 for(var i=0;i<json.length;i++){  
			 // $("#recyclelist").append("<li><a href="+json[i].url+">"+json[i].bookmarkname+"</a></li>");
			 id=json[i].bookmarkid;
			  url = json[i].url;
			  name =  json[i].bookmarkname;//'<a href="'+url+'">'+name+'"</a>'
			  $("#recyclelist").append('<label><input name="recycledmark" type="checkbox" value="'+id+'" />'+'<a href="'+url+'">'+name+'</a>'+'</label>'+'<br>');
			
			 }    
		},
		error : function(e) {
			alert(e);
		}
	});
	
	 $("#aaa").click(function(){
		 var str = "";
		$("[name='w']:checked").each(function(){
			
			 str+=$(this).val()+"\n";    
		});
		alert(str);
	});
	 
	 $("#back").click(function(){
		 var str = "";
		$("[name='recycledmark']:checked").each(function(){
			
			 str+=$(this).val()+";";    
		});
		//alert(str);
		$.ajax({
			data:'bookmarkid='+str,
			type : "post",
			url : "${context_path}/doRecoverBookmark",
			success : function(json) {
				if(json>0){
					alert("恢复成功");
				}else{
					alert("恢复失败");
				}
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
	//	alert(str);
		$.ajax({
			data:'bookmarkid='+str,
			type : "post",
			url : "${context_path}/doPhysicsDelBookmark",
			dataType:"json",
			success : function(json) {
				if(json>0){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
			},
			error : function(e) {
				alert(e);
			
			}
		});
	});

});
	
</script>
<body>
  <input type="button" id="back" value="恢复"></input>
   <input type="button" id="delete" value="删除"></input>
<form id="recyclelist">


	回收站<br /><br /> 
	<input type="button" id="btn1" value="全选">     
   <input type="button" id="btn2" value="取消全选">     
   <input type="button" id="btn3" value="选中所有奇数">     
   <input type="button" id="btn4" value="反选">     
   <input type="button" id="btn5" value="获得选中的所有值">   
    <br>  
</form>
</body>
</html>