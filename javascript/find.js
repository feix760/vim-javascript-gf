
var path = require('path');
var relative = require('./require-relative');

var project = process.argv[2] || '';
var file = process.argv[3] || '';
var ref = process.argv[4] || '';

// require('/module/file')
// project absolute path
if (ref.match(/^\//)) {
  ref = path.join(project, ref);
}

var ret;

try {
  ret = relative.resolve(ref, file);
} catch(ex) {
}

console.log(ret || '');
