let preview_picture = function () {
  var result = URL.createObjectURL(event.target.files[0]);
  $('#img-upload').attr('src', result);
  console.log($('#img-upload'))
  $('#image').removeClass('d-none');
}

module.exports = preview_picture