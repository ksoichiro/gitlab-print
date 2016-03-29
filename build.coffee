command = process.argv[2]

fs = require 'fs-extra'
rimraf = require 'rimraf'
archiver = require 'archiver'

buildDir = 'build'
tmpDir = "#{buildDir}/tmp"
libDir = "#{tmpDir}/lib"
extensionDir = "#{buildDir}/extension"

clean = ->
  rimraf.sync buildDir

build = ->
  fs.mkdirsSync libDir
  fs.copySync 'src', "#{tmpDir}/src",
    filter: (s) -> s.split('.').pop() is 'css'
  fs.copySync '_locales', "#{tmpDir}/_locales",
  fs.copySync 'icons', "#{tmpDir}/icons"
  fs.copySync 'manifest.json', "#{tmpDir}/manifest.json"
  fs.copySync 'license', "#{tmpDir}/license"
  fs.copySync 'node_modules/jquery/dist/jquery.min.js', "#{libDir}/jquery.min.js"

release = ->
  fs.copySync tmpDir, extensionDir

  archive = archiver.create 'zip', {}
  output = fs.createWriteStream "#{buildDir}/extension.zip"
  archive.pipe output
  archive.bulk [
    expand: true
    cwd: extensionDir
    src: ['**']
    dest: 'extension'
  ]
  archive.finalize()

eval(command)()
