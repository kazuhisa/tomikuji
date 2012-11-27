# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".key").click ->
    btnClick($(this).text())

# 表示処理
btnClick = (number) ->
  if number == "clear"
    $("#number").text("")
  else
    score = $("#number").text()
    if score.length < 6
      $("#number").text(score + number)

