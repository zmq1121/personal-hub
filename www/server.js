const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 8080;
const ROOT = __dirname;

const MIME_TYPES = {
  '.html': 'text/html; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.js': 'application/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2'
};

const server = http.createServer((req, res) => {
  let filePath = req.url === '/' ? '/personal-hub.html' : req.url;
  filePath = path.join(ROOT, filePath);
  
  const ext = path.extname(filePath).toLowerCase();
  const contentType = MIME_TYPES[ext] || 'application/octet-stream';
  
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(404);
      res.end('Not Found');
      return;
    }
    
    res.writeHead(200, {
      'Content-Type': contentType,
      'Access-Control-Allow-Origin': '*',
      'Cache-Control': 'no-cache'
    });
    res.end(data);
  });
});

server.listen(PORT, () => {
  console.log('');
  console.log('========================================');
  console.log('   个人效率中心 - 本地服务器已启动');
  console.log('========================================');
  console.log('');
  console.log('请在浏览器中访问:');
  console.log(`  http://localhost:${PORT}/personal-hub.html`);
  console.log('');
  console.log('按 Ctrl+C 停止服务器');
  console.log('========================================');
  console.log('');
  
  // 自动打开浏览器
  const { exec } = require('child_process');
  const url = `http://localhost:${PORT}/personal-hub.html`;
  
  // Windows
  exec(`start ${url}`);
});
