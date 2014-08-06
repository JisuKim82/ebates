$(document).ready(function(){
  $('#example-btn').on('click', function(event){
    event.preventDefault();
    $(this).closest('.inner').find('#example').toggle('slow');
  });
});