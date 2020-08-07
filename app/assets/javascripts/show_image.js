function preview_picture() {
  var result = URL.createObjectURL(event.target.files[0]);
  $('#img-upload').attr('src', result);
  console.log($('#img-upload'))
  $('#image').removeClass('d-none');
}