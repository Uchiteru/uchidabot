# Description
#   A Hubot script
#
# Configuration:
#   None
#
# Commands:
#   hubot (From)から(To) - It's possible to see connection information in time now.
#
# Author:
#  Uchiteru
request = require("request")
cheerio = require("cheerio")


module.exports = (robot) ->
  robot.respond /(.*)から(.*)/, (msg) ->
    from = encodeURIComponent(msg.match[1])
    to = encodeURIComponent(msg.match[2])
    url = "http://www.jorudan.co.jp/norikae/cgi/nori.cgi?Sok=1&eki1=#{from}&eki2=#{to}&type=t"
    options =
      url: url
      timeout: 2000
      headers: {'user-agent': 'node title fetcher'}

    request options, (error, response, body) ->
      $ = cheerio.load body
      now = $('#left > pre').text()
      msg.send "#{now}"
