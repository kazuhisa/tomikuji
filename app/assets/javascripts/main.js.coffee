# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".key").click ->
    btnClick($(@).text())
		setTimeout("scrollTo(0,1)",100)

# 当たり番号
hits =
  "1等" : "187077"
  "2等" : "179409"
  "3等" : "119658"
  "4等" : "....30"
  "5等" : ".....9"

# 表示処理
btnClick = (number) ->
  if number == "clear"
    $("#number").text("")
    $("#message").text("")
  else
    score = $("#number").text() + number
    if score.length <= 6
      $("#number").text(score)
      showResult(score)

# 結果表示
showResult = (score) ->
  message = ""
  for key, value of hits
    diff = value.slice(0, score.length)
    if score.match(new RegExp("^#{diff}"))
      message = message + key
  if message == ""
    $("#message").text("残念！")
  else
    $("#message").text("#{message}の可能性があります")

# スクロール
hideAddressBar ->
  setTimeout("scrollTo(0,1)", 100)
