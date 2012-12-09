$('#more_tweets').attr("disabled",false)
$("#loading").attr("class","loading-gif-none")
$("#tweets").html("<%= escape_javascript(render(@tweets)) %>")

error_message = "<%= escape_javascript(@error) %>"
if error_message
  $('#error').text(error_message)
else
  $('#error').text("")
