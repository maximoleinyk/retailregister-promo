Autoprefixer = require('less-plugin-autoprefix')
CleanCSS = require('less-plugin-clean-css')

module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    clean:
      build:
        src: ['dist']

    eslint:
      target:
        src: ['assets/js/app/**/*.js']
      options:
        config: 'eslint.json'

    watch:
      scripts:
        files: ['assets/**/*.js', 'assets/**/*.hbs']
        tasks: ['dev']
      styles:
        files: ['assets/**/*.less']
        tasks: ['less', 'copy:css']
      templates:
        files: ['assets/js/app/**/*.hbs']
        tasks: ['handlebars']

    handlebars:
      templates:
        files:
          'assets/js/app/templates.js': ['assets/js/app/**/*.hbs']
        options:
          namespace: 'RetailRegisterPromo.templates'
          processName: (filePath) ->
            filePath.replace(/assets\/js\/app\/templates\/(.*)\.hbs/, '$1')

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
  grunt.loadNpmTasks('grunt-contrib-handlebars')
  grunt.loadNpmTasks('grunt-preprocess')
  grunt.loadNpmTasks('grunt-eslint')

  grunt.registerTask('dev', ['clean', 'less', 'copy', 'handlebars', 'preprocess'])
  grunt.registerTask('build', ['dev', 'uglify'])

  grunt.registerTask('default', ['dev'])
