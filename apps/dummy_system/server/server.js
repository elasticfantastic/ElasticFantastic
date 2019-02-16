var express = require('express');
var app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded());
app.use(bodyParser.json());

var log4js = require('log4js');
var logger = log4js.getLogger();
logger.level = 'debug';

log4js.configure({
    appenders: {
        out: {
            type: 'console', layout: {
                type: 'pattern',
                pattern: '[Server] [%p] [%dZ] - %m'
            }
        },
        task: {
            type: 'file', filename: 'logs/server.log', layout: {
                type: 'pattern',
                pattern: '[Server] [%p] [%dZ] - %m'
            }
        }
    },
    categories: {
        default: {
            appenders: [ 'out', 'task' ], level: 'info'
        }
    }
});

app.post('/order', (req, res) => {
    logger.info("Request from " + req.ip + ', content: ' + JSON.stringify(req.body));
    res.status(200);
    logger.info("Saving order...");
    res.send();
});

app.listen(7000, () => console.log("Server running on port 7000"));