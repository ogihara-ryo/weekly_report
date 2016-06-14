// turbolinks の関係で、 alert がなぜか2回出る
var unsaved
var formWarningMessage = "登録・保存していない入力内容は破棄されますがよろしいですか？"

$(document).on('ready page:change', function(){
  unsaved = false

  if($('form').length > 0){
    $('input, textarea, select').on('change', function(){
      unsaved = true
    })
  }

  $('a').click(function(e){
    var href = $(this).attr('href')
    if (typeof(href) !== "undefined" && href != '#' && unsaved) {
      if (confirm(formWarningMessage) == false) {
        e.preventDefault()
      }
    }
  })
})
