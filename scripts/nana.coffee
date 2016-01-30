# Description
#   A Hubot script for listing advent calendars in Adventar
#
# Configuration:
#   None
#
# Commands:
#   nanablog - lists advent calendars in Adventar
#
# Author:
#  Uchiteru
request = require("request")
cheerio = require("cheerio")
client= require('cheerio-httpcli')


module.exports = (robot) ->
  robot.respond /nanablog/, (msg) ->
    url = 'http://www.mizukinana.jp/blog/'
    options =
      url: url
      timeout: 2000
      headers: {'user-agent': 'node title fetcher'}

    request options, (error, response, body) ->
      $ = cheerio.load body
      message = $('div.postcontent').first()
      img = message.find('img')
      img = img.map(->
        $(this).attr 'src'
      ).get()
      message = message.text()
      msg.send "#{message},#{img}"
