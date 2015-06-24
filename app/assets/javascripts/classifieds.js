$(document).ready(function(){


  $(document).on('change', '.main_cat', function(){
    var $selected = $('#item_category_id :selected').text()

    $.ajax("/subcategories", {

      type: 'get',
      data: {"selectedCategory": $selected},

      success: function(data){
        console.log(data);
        $sub = $('.sub_cat')
        $sub.empty();
        for(var i = 0; i < data.length; i++){
          $sub.append("<option value=" + data[i].id + ">" + data[i].sub_category + "</option>")
        }
      },

      error: function(data){
        console.log(data);
        console.log('this is error');
      }

    });
  });

});
