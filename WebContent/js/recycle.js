$(function() {
	$.ajax({
		type : "post",
		url : CONTEXT_PATH+"/doSelectRecycleBookmarkList",
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
		if(str==""){
			 $(".popbox-for-alert").show();
			 $(".popbox-for-alert .tipmsg > span").text("请至少选择一项");
			 return;
		}
		$.ajax({
			data:'bookmarkno='+str,
			type : "post",
			url : CONTEXT_PATH+"/doRecoverBookmark",
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
				url : CONTEXT_PATH+"/doPhysicsDelBookmark",
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