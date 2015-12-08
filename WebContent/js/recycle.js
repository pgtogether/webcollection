$(function() {
		$.ajax({
			type : "post",
			url : "${context_path}/doSelectRecycleBookmarkList",
			dataType:"json",
			success : function(json) {
				 for(var i=0;i<json.length;i++){  
				  $("#recyclelist").append("<li><a href="+json[i].url+">"+json[i].bookmarkname+"</a></li>");
				}    
			},
			error : function(e) {
				alert(e);
			}
		});

});

