$(document).ready(function(){
  $(document).on('change', '#year',function(){
    $.ajax({
      url:'/cars/ajax_make/'+ $('#year').val()
    });
  });

  $(document).on('change', '#make',function(){
    $.ajax({
      url: 'cars/ajax_model/' + $('#year').val() + '/' + $('#make').val()
    })
  });
});
