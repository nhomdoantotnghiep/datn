$(document).ready(function(){
    $('.bxslider').bxSlider({
        infiniteLoop: true,
        auto : true,
        autoStart : true
    });
  $(".button").click(function(e) {
        $("body").append('<div class="overlay"></div>');
		$(".popup").show();
		
		$(".close").click(function(e) {
			$(".popup, .overlay").hide();
		});
    });
});