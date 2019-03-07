$(function() {
  $(".form-group-shipping").hide();
  //カテゴリーのセレクタで使用
  // $(".form-group-size").hide();
  // $(".form-group-brand").hide();

  $(".select-delivery").on("change", function() {
    var deliveryID = $(this).val();
    $(".select-method").val("");
    if(deliveryID == 0){
      $(".form-group-shipping").hide();
    } else {
      $(".form-group-shipping").show();
    }
  });
  //カテゴリーのセレクタで使用
  // $(".select-category").on("change", function() {
  //   var categoryID = $(this).val();
  //   $(".select-size").val("");
  //   $(".input-brand").val("");
  //   if(deliveryID == 0){
  //     $(".form-group-size").hide();
  //     $(".form-group-brand").hide();
  //   } else {
  //     $(".form-group-size").show();
  //     $(".form-group-brand").hide();
  //   }
  // });
});
