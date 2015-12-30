<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;
}

body {
	font-family: sans-serif;
}

/* ---- button ---- */
.button {
	display: inline-block; padding: 10px 18px; margin-bottom: 10px; background: #EEE; border: none; border-radius: 7px; background-image: linear-gradient(to bottom, hsla(0, 0%, 0%, 0), hsla(0, 0%, 0%, 0.2)); color: #222; font-family: sans-serif; font-size: 16px; text-shadow: 0 1px white; cursor: pointer;
}

.button:hover {
	background-color: #8CF; text-shadow: 0 1px hsla(0, 0%, 100%, 0.5); color: #222;
}

.button:active,.button.is-checked {
	background-color: #28F;
}

.button.is-checked {
	color: white; text-shadow: 0 -1px hsla(0, 0%, 0%, 0.8);
}

.button:active {
	box-shadow: inset 0 1px 10px hsla(0, 0%, 0%, 0.8);
}

/* ---- button-group ---- */
.button-group:after {
	content: ''; display: block; clear: both;
}

.button-group .button {
	float: left; border-radius: 0; margin-left: 0; margin-right: 1px;
}

.button-group .button:first-child {
	border-radius: 0.5em 0 0 0.5em;
}

.button-group .button:last-child {
	border-radius: 0 0.5em 0.5em 0;
}

/* ---- isotope ---- */
.grid {
	border: 1px solid #333;
	width:45%;
	float: left;
}

/* clear fix */
.grid:after {
	content: ''; display: block; clear: both;
}

/* ---- .element-item ---- */
.element-item {
	position: relative; float: left; width: 100px; height: 100px; margin: 5px; padding: 10px; background: #888; color: #262524;
}

.element-item>* {
	margin: 0; padding: 0;
}

.element-item .name {
	position: absolute; left: 10px; top: 60px; text-transform: none; letter-spacing: 0; font-size: 12px; font-weight: normal;
}

.element-item .symbol {
	position: absolute; left: 10px; top: 0px; font-size: 42px; font-weight: bold; color: white;
}

.element-item .number {
	position: absolute; right: 8px; top: 5px;
}

.element-item .weight {
	position: absolute; left: 10px; top: 76px; font-size: 12px;
}

.element-item.alkali {
	background: #F00; background: hsl(0, 100%, 50%);
}

.element-item.alkaline-earth {
	background: #F80; background: hsl(36, 100%, 50%);
}

.element-item.lanthanoid {
	background: #FF0; background: hsl(72, 100%, 50%);
}

.element-item.actinoid {
	background: #0F0; background: hsl(108, 100%, 50%);
}

.element-item.transition {
	background: #0F8; background: hsl(144, 100%, 50%);
}

.element-item.post-transition {
	background: #0FF; background: hsl(180, 100%, 50%);
}

.element-item.metalloid {
	background: #08F; background: hsl(216, 100%, 50%);
}

.element-item.diatomic {
	background: #00F; background: hsl(252, 100%, 50%);
}

.element-item.halogen {
	background: #F0F; background: hsl(288, 100%, 50%);
}

.element-item.noble-gas {
	background: #F08; background: hsl(324, 100%, 50%);
}
</style>
</head>
<script type="text/javascript">
</script>
<body>
	<h1>Isotope - filtering</h1>

	<div class="button-group filters-button-group">
		<button class="button is-checked" data-filter="*">show all</button>
		<button class="button" data-filter=".tool">metal</button>
		<button class="button" data-filter=".transition">transition</button>
	</div>
	<div class="wrap-box">
		<div class="block">
			<div class="block-head head-style">
				<div class="block-head-title category-title">默认分类</div>
				<div class="block-head-func"></div>
			</div>
			<div class="block-body">
					<ul class="url-list">
						<li id="h_6" value="6" title="百度2" class="filter-item tool"
							style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
						<li id="h_6" value="6" title="百度2" class="filter-item transition"
							style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
						<li id="h_6" value="6" title="百度2" class="filter-item tool"
						style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
						<li id="h_6" value="6" title="百度2" class="filter-item transition"
							style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
						<li id="h_6" value="6" title="百度2" class="filter-item tool"
							style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
						<li id="h_6" value="6" title="百度2" class="filter-item tool"
							style=""><a href="http://www.baidu.com"
							target="_blank" style="">百度2</a>
							<div class="operatebtn"></div></li>
					</ul>
				</div>
		</div>
	</div>
<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
<jsp:include page="/js/dynamic/isotope.js.jsp"></jsp:include>
<script type="text/javascript">
$( function() {
	  // init Isotope
	  var $grid = $('.url-list').isotope({
	    itemSelector: '.filter-item',
	    layoutMode: 'fitRows'
	  });
	  // filter functions
	  var filterFns = {
	    // show if number is greater than 50
	    numberGreaterThan50: function() {
	      var number = $(this).find('.number').text();
	      return parseInt( number, 10 ) > 50;
	    },
	    // show if name ends with -ium
	    ium: function() {
	      var name = $(this).find('.name').text();
	      return name.match( /ium$/ );
	    }
	  };
	  // bind filter button click
	  $('.filters-button-group').on( 'click', 'button', function() {
	    var filterValue = $( this ).attr('data-filter');
	    // use filterFn if matches value
	    filterValue = filterFns[ filterValue ] || filterValue;
	    $grid.isotope({ filter: filterValue });
	  });
	  // change is-checked class on buttons
	  $('.button-group').each( function( i, buttonGroup ) {
	    var $buttonGroup = $( buttonGroup );
	    $buttonGroup.on( 'click', 'button', function() {
	      $buttonGroup.find('.is-checked').removeClass('is-checked');
	      $( this ).addClass('is-checked');
	    });
	  });
	});
</script>
</body>
</html>