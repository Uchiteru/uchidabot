request = require("request")
cheerio = require("cheerio")
url = 'http://www.mizukinana.jp/blog/'
options =
  url: url
  timeout: 2000
  headers: {'user-agent': 'node title fetcher'}

request options, (error, response, body) ->
  $ = cheerio.load body
  message = $('#entry-3377')
  img = message.find('img')
  img = img.map(->
    $(this).attr 'src'
  ).get()
  message = message.text()
  console.log(message,img)
