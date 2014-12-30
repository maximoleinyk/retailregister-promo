Autoprefixer = require('less-plugin-autoprefix')
CleanCSS = require('less-plugin-clean-css')

module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    clean:
      build:
        src: ['dist']

    watch:
      scripts:
        files: ['assets/**/*.js']
        tasks: ['preprocess']
      styles:
        files: ['assets/**/*.css']
        tasks: ['autoprefixer', 'cssmin']

    copy:
      main:
        src: 'assets/robots.txt'
        dest: 'dist/robots.txt'
      css:
        src: 'assets/css/main.css'
        dest: 'dist/css/main.css'

    less:
      build:
        options:
          plugins: [
            new Autoprefixer({
              browsers: ['last 2 version', 'ie 10', 'ie 11']
            }),
            new CleanCSS({
              advanced: true
            })
          ]
          modifyVars:
            bgColor: 'red'
        files:
          "assets/css/main.css": "assets/css/main.less"

    preprocess:
      js:
        src: 'assets/js/main.js'
        dest: 'dist/js/main.js'

    uglify:
      options:
        mangle: false
      build:
        files:
          'dist/js/main.js': ['dist/js/main.js']

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-preprocess')

  grunt.registerTask('default', ['clean', 'less', 'copy', 'preprocess', 'uglify'])
