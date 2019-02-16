var request = require('request');

var log4js = require('log4js');
var logger = log4js.getLogger();
logger.level = 'debug';

log4js.configure({
    appenders: {
        out: {
            type: 'console', layout: {
                type: 'pattern',
                pattern: '[Client] [%p] [%dZ] - %m'
            }
        },
        task: {
            type: 'file', filename: 'logs/client.log', layout: {
                type: 'pattern',
                pattern: '[Client] [%p] [%dZ] - %m'
            }
        }
    },
    categories: {
        default: {
            appenders: [ 'out', 'task' ], level: 'info'
        }
    }
});

function doRequest() {
    var products = ['banana', 'apple', 'pear', 'cherry', 'pineapple']; 

    var customerIdValue = Math.floor(Math.random() * 100) + 1;
    var productValue = products[Math.floor(Math.random() * products.length)];
    
    var options = {
        uri: 'http://localhost:7000/order',
        method: 'POST',
        json: {
            customerId: customerIdValue,
            product: productValue
        }
    };
    
    logger.info('Sending order request from customer [' + customerIdValue + '] to server...');
    request.post(options, function (error, response, body) {
        if (error) {
            logger.error('ERROR!' + error);
        } else if (!error && response.statusCode == 200) {
            logger.info('Order placement for [' + productValue + '] was a success');
        }
    });
}
setInterval(doRequest, Math.floor(Math.random() * 1000) + 1 + 5000);