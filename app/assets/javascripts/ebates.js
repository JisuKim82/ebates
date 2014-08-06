$(document).ready(function(){
  $('#example-btn').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    $(this).closest('.inner').find('#example').toggle('slow');
  });

  $("a#giftcards").tooltip();

  $('a#giftcards').on('click', function(event){
    event.preventDefault();
	  event.stopPropagation();
	  $(this).tooltip();
  });
}); 



