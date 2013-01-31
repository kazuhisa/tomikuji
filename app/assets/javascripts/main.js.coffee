# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  if Modernizr.touch
    $(".key").bind 'touchend', (event) ->
      btnClick($(@).text())
  else
    $(".key").click ->
      btnClick($(@).text())
  setTimeout("scrollTo(0,1)",100)

# 当たり番号
hits =
  "1等" : ["195280"]
  "前後賞" : ["195279","195281"]
  "2等" : ["107914","158839","179593"]
  "3等" : ["130749"]
  "4等" : ["..1600"]
  "5等" : ["....07"]
  "6等" : [".....0"]

# 表示処理
btnClick = (number) ->
  if number == "clear"
    $("#number").text("")
    $("#message").text("")
  else
    score = $("#number").text() + number
    if score.length <= 6
      $("#number").text(score)
      searchNumber(score)

# 当たり番号探査
searchNumber = (score) ->
  messages = []
  for key, values of hits
    for value in values
      diff = value.slice(0, score.length)
      if score.match(new RegExp("^#{diff}"))
        messages.push(key) unless key in messages
  showResult(messages)

# 結果表示
showResult = (messages) ->
  if messages.length == 0
    $("#message").text("残念！")
  else
    $("#message").text("#{messages.join(',')}の可能性があります")
