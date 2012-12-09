$('#more_tweets').attr("disabled",false)
$("#loading").attr("class","loading-gif-none")
$("#tweets").html("<%= escape_javascript(render(@tweets)) %>")
