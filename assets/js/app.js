$(function(){

	function releaseItems(){
		$('#addItem').removeClass('pure-button-disabled');
		$('.category').removeClass('pure-button-disabled');
		$('.category').removeClass('pure-button-success');
		$('#inputText').val('');
	}

	$('.category').click(function(){
		$(this).addClass('pure-button-active pure-button-success');
		$('.category').not(this).addClass('pure-button-disabled');
	});

	$('#addItem').click(function(){
		$(this).addClass('pure-button-disabled');
		var text = $('#inputText').val();
		var theButton = $("button[class*='pure-button-active']");
		var category = $(theButton).attr('id');

		$.post('/add', {text: text, category:category}, function(response){
			if (response.saved === true){
				releaseItems();
			} else {
				new Error();
			}
		});
	});
});