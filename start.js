require('coffee-script/register');

var path = require('path'),
 start = require('./app');

start({
 port: 8080,
 debug: (process.env.NODE_ENV !== 'production'),
 viewsDir: path.join(__dirname, 'views'),
 staticDir: path.join(__dirname, 'public')
});
