var command = process.argv[2];

var fs = require('fs-extra');
var rimraf = require('rimraf');
var archiver = require('archiver');

var buildDir = 'build';
var tmpDir = buildDir + '/tmp';
var libDir = tmpDir + '/lib';
var extensionDir = buildDir + '/extension';

clean = function() {
  rimraf.sync(buildDir);
};

build = function() {
  fs.mkdirsSync(libDir);
  fs.copySync('src', tmpDir + '/src');
  fs.copySync('icons', tmpDir + '/icons');
  fs.copySync('manifest.json', tmpDir + '/manifest.json');
  fs.copySync('license', tmpDir + '/license');
  fs.copySync('node_modules/jquery/dist/jquery.min.js', libDir + '/jquery.min.js');
};

release = function() {
  fs.copySync(tmpDir, extensionDir);

  var archive = archiver.create('zip', {});
  var output = fs.createWriteStream(buildDir + '/extension.zip');
  archive.pipe(output);
  archive.bulk([
    {
      expand: true,
      cwd: extensionDir,
      src: ['**'],
      dest: 'extension'
    }
  ]);
  archive.finalize();
};

eval(command)();
