var validateErrorsUtil = {
	// 本方法主要处理JSR303的验证错误
	// 把后台返回的错误显示样式与Jquery.validate插件的错误样式统一
	showValidateErrors : function($validateform, errors) {
		if (!errors) {
			return;
		}
		// 例子：
		// <input type="text" id="url" name="url" placeholder="例:www.52url.com" value="" aria-required="true" class="error">
		// <label id="url-error" class="error" for="url">请输入网址</label>
		this.clearValidateErrors($validateform);
		for ( var index in errors) {
			var error = errors[index];
			var field = error.field;
			var message = error.defaultMessage;
			var $errorField = $validateform.find("#"+field);
			$errorField.addClass("error");
			var errorLabel = '<label id="'+field+'-error" class="error" for="'+field+'">'+message+'</label>';
			$errorField.after(errorLabel);
		}
	},
	// 清除前一次的错误
	clearValidateErrors : function($validateform){
		$validateform.find("label.error").remove();
		$validateform.find("input.error").removeClass("error");
	}
};
// 随机颜色
var randomColor = [ "#FFCACA", "#FFE8CA", "#F9F4BD", "#CAFFCA", "#AEFBDC",
		"#BBE6F7", "#BBCAF7", "#DFBCEC", "#FFEAC3", "#C8ECC8", "#BBF4F7",
		"#FBF6AE", "#FBAECD", "#FDC2F8", "#E6CEFF", "#C1E5FF", "#ADF5EF",
		"#D4F9AD", "#CBF7CD", "#FFD1BA" ];