<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myweb</title>
<link rel="stylesheet" href="${context_path}/css/base.css"
	type="text/css">
<style>
.container {
	position: relative;
	margin-top: 50px;
}

.container>li {
	position: absolute;
}

.container>.ss-placeholder-child {
	background: transparent;
	border: 1px dashed blue;
}

.grid {
	width: 50%;
	float: left;
}

.grid-item {
	width: 15%;
	height: 150px;
	background: #bbb;
	float: left;
	margin-left: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	margin-bottom: 10px;
}

/* .grid-item--height2 { */
/* 	height: 250px; */
/* } */

/* .grid-item--height2 { */
/* 	height: 300px; */
/* } */
</style>
<script src="${context_path}/js/jquery-2.1.4.min.js"></script>
<script src="${context_path}/js/jquery-ui.min.js"></script>
<script src="${context_path}/js/masonry.pkgd.js"></script>
</head>
<body>
	<ul id="container" class="container grid">
		<li id="box_1" class="grid-item">1</li>
		<li id="box_2" class="grid-item  grid-item--height2">2</li>
		<li id="box_3" class="grid-item grid-item--height3">3</li>
		<li id="box_4" class="grid-item grid-item--height2">4</li>
		<li id="box_5" class="grid-item">5</li>
		<li id="box_6" class="grid-item">6</li>
		<li id="box_7" class="grid-item">7</li>
		<li id="box_8" class="grid-item grid-item--height2">8</li>
		<li id="box_9" class="grid-item grid-item--height3">9</li>
		<li id="box_10" class="grid-item">10</li>
	</ul>
	<ul id="container" class="container grid">
		<li id="box_11" class="grid-item grid-item--height2">11</li>
		<li id="box_12" class="grid-item">12</li>
		<li id="box_13" class="grid-item grid-item--height2">13</li>
		<li id="box_14" class="grid-item">14</li>
		<li id="box_15" class="grid-item">15</li>
		<li id="box_16" class="grid-item grid-item--height2">16</li>
		<li id="box_17" class="grid-item">17</li>
		<li id="box_18" class="grid-item">18</li>
		<li id="box_19" class="grid-item grid-item--height3">19</li>
		<li id="box_20" class="grid-item grid-item--height2">20</li>
		<li id="box_21" class="grid-item">21</li>
		<li id="box_22" class="grid-item">22</li>
		<li id="box_23" class="grid-item grid-item--height2">23</li>
	</ul>
	<div class="footer"></div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var $grid = $('.container');

		$grid.masonry({
			itemSelector : '.grid-item'
		});

		$grid.sortable({
			connectWith : ".grid",
			update : function(event, ui) {
				$grid.masonry("reloadItems").masonry("layout");
				var arr = $('.container').sortable('toArray', {
					attribute : "id"
				});
				console.log(arr);
			}
		});
	});
</script>
</html>