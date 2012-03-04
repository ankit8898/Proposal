$('<%= escape_javascript(render(:partial => @proposal))%>')
  .appendTo('#proposals')
  .hide()
  .fadeIn()

