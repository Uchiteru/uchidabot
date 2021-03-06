# Description
#   A Hubot script
#
# Configuration:
#   None
#
# Commands:
#   nanablog - can see  new entry Nana Mizuki write .
#
# Author:
#  Uchiteru
request = require("request")
cheerio = require("cheerio")


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
      ).get().join('\n')
      message = message.text()
      msg.send "#{message},#{img}"
