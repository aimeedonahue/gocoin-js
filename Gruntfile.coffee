module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee: 
      dist: 
        expand: true
        flatten: false
        cwd: 'src'
        src: ['*.coffee']
        dest: 'lib'
        ext: '.js'
      dist_two: 
        expand: true
        flatten: false
        cwd: 'src/api'
        src: ['*.coffee']
        dest: 'lib/api'
        ext: '.js'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.registerTask 'default', ['coffee']

