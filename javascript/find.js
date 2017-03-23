
var path = require('path');
var relative = require('require-relative');

var project = process.argv[2] || ''; // project root path
var file = process.argv[3] || ''; // project file name eg: '/Users/project/index.js'
var ref = process.argv[4] || ''; // ref name eg: 'react'

// project absolute path
// eg: require('/module/file')
if (ref.match(/^\//)) {
  ref = path.join(project, ref);
}

var ret;

try {
  ret = relative.resolve(ref, file);
} catch(ex) {
}

// sometimes module's ref is sibling. (npm flat install)
// eg: 
//  node_modules
//     a/index.js
//     b
//  in a/index.js require('b')
if (!ret && ref.match(/^[^\.\/]/) && file.match(/node_modules/)) {
  try {
    ret = relative.resolve(ref, file.replace(/\/node_modules\/.*?$/, ''));
  } catch(ex) {
  }
}

console.log(ret || '');
