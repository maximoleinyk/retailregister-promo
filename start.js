require('coffee-script/register');

var path = require('path'),
    start = require('./app'),
    isDev = (process.env.NODE_ENV !== 'production');

start({
    port: 8080,
    debug: isDev,
    viewsDir: path.join(__dirname, 'views'),
    staticDir: path.join(__dirname, isDev ? '/assets' : '/dist'),
    staticPath: isDev ? '/assets' : '/dist'
});
