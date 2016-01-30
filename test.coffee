request = require("request");
cheerio = require("cheerio");


request(
		uri: 'http://www.mizukinana.jp/blog/'
	function(error, response, body) {
		$ = cheerio.load(body); //取得したページのbody部をパース
    $('div.postcontent').first().each(function()) { //パースした内容にはjQuery風のセレクタでアクセスできる
			link = $(this)
			text = link.text()

			console.log(text + " -> " + href)
