process.env.DEBUG = process.env.DEBUG || 'checkip';

const debug = require('debug')('checkip')
const express = require('express');
const app = express();

function log(...args) {
    debug(`${new Date().toISOString()}`, ...args)
}

app.get('/', (req, res) => {
  let remoteAddress =
    req.headers['x-forwarded-for'] ||
    (req.socket.remoteAddress && req.socket.remoteAddress.replace(/^.*:/, '')) ||
    null;
  remoteAddress = remoteAddress && remoteAddress.replace(/^.*:/, '') || null;
  if (!remoteAddress) {
    log(`[ERROR] FAILED TO RESOLVE REMOTE ADDRESS:`, req.headers);
    res.status(400).send(`0.0.0.0\n`);
  } else {
    log(`[INFO] RESOLVED: ${remoteAddress};`, req.headers);
    res.send(`${remoteAddress}\n`);
  }
});

const NODE_PORT = process.env.NODE_PORT && parseInt(process.env.NODE_PORT) || 8080;
app.listen(NODE_PORT, () => {
    log(`[INFO] Server listening on port ${NODE_PORT}...`);
});
