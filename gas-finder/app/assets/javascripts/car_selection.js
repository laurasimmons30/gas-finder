$(document).ready(function(){
  $(document).on('change', '#year',function(){
    // Using jquery, get the VAL of the select box

    // give the url, with the year, to ajax_make
    $.ajax({
      url:'/cars/ajax_make/'+ $('#year').val()
    });
  });
});
