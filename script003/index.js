var http = require('http')
  , cheerio = require('cheerio');

var doc = '1234567';

var options = {
  host: 'sis.senavirtual.edu.co',
  path: '/cuentas_misena/consulta.php?tx_doc='+doc
}

callback = function (response) {
  var str = '';

  response.on('data', function (chunk) {
    str += chunk;
  });

  response.on('end', function () {
    var parsedHTML = cheerio.load(str);

    parsedHTML('td.txt_grey').map(function (i, foo) {
      foo = cheerio(foo);
      console.log(i + " : " + foo.text());
    });
  });
}

http.request(options, callback).end();
