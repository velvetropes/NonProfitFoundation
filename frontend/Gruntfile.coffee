"use strict"

module.exports = (grunt) ->
  # time it!
  require("time-grunt") grunt

  # skip the formalities, just load the tasks
  require("load-grunt-tasks") grunt

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    sass:
      dist:
        options:
          loadPath: require('node-neat').includePaths
        files: '.tmp/styles/app.css' : 'app/styles/app.scss',

    app:
      src: "app"
      dist: "dist"

    watch:
      css:
        files: ['**/*.scss'],
        tasks: ['sass','autoprefixer']

      styles:
        files: ["<%= app.src %>/styles/{,*/}*.css"]
        tasks: ["copy:styles", "autoprefixer"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [
          "<%= app.src %>/*.html",
          ".tmp/styles/{,*/}*.css",
          "{.tmp,<%= app.src %>}/scripts/{,*/}*.js",
          "<%= app.src %>/images/{,*/}*.{gif,jpeg,jpg,png,svg,webp}"
        ]

      coffee:
        files: ["<%= app.src %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:dist"]

    coffee:
      dist:
        files: [
          expand: true
          cwd: "<%= app.src %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    mocha:
      all:
        options:
          run: true
          urls: ["http://<%= connect.test.options.hostname %>:<%= connect.test.options.port %>/index.html"]

    autoprefixer:
      options:
        browsers: ["last 1 version"]

      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]

    "bower-install":
      app:
        html: "<%= app.src %>/index.html"
        ignorePath: "<%= app.src %>/"

      dist:
        options:
          generatedImagesDir: "<%= app.dist %>/images/generated"

      server:
        options:
          debugInfo: true

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: ["Gruntfile.js", "<%= app.src %>/scripts/{,*/}*.js", "!<%= app.src %>/scripts/vendor/*", "test/spec/{,*/}*.js"]

    # +concat+ and +uglify+ are not enabled since usemin task does this

    useminPrepare:
      options:
        dest: "<%= app.dist %>"

      html: "<%= app.src %>/index.html"

    usemin:
      options:
        assetsDirs: ["<%= app.dist %>"]

      html: ["<%= app.dist %>/{,*/}*.html"]
      css: ["<%= app.dist %>/styles/{,*/}*.css"]

    htmlmin:
      dist:
        options: {}
        files: [
          expand: true
          cwd: "<%= app.src %>"
          src: "*.html"
          dest: "<%= app.dist %>"
        ]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.{gif,jpeg,jpg,png}"
          dest: "<%= app.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.svg"
          dest: "<%= app.dist %>/images"
        ]


    connect:
      options:
        port: 9000
        livereload: 35729

        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          open: true
          base: [
            ".tmp",
            "<%= app.src %>"
          ]

      test:
        options:
          base: [
            ".tmp",
            "test",
            "<%= app.src %>"
          ]

      dist:
        options:
          open: true
          base: "<%= app.dist %>"
          livereload: false

    clean:
      dist:
        files: [
          dot: true
          src: [
            ".tmp",
            "<%= app.dist %>/*",
            "!<%= app.dist %>/.git*"
          ]
        ]

      server: ".tmp"

    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= app.src %>"
          dest: "<%= app.dist %>"
          src: [
            "*.{ico,png,txt}",
            ".htaccess",
            "images/{,*/}*.{webp,gif}",
            "styles/fonts/{,*/}*.*"
          ]
        ]

      styles:
        expand: true
        dot: true
        cwd: "<%= app.src %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"

    concurrent:
      server: [
        "coffee:dist",
        "sass",
        "copy:styles"
      ]
      test: ["copy:styles"]
      dist: [
        "coffee:dist"
        "sass"
        "copy:styles"
        'imagemin'
        'svgmin'
        'htmlmin'
      ]

    rev:
      dist:
        files:
          src: [
            "<%= app.dist %>/scripts/{,*/}*.js",
            "<%= app.dist %>/styles/{,*/}*.css",
            "<%= app.dist %>/images/{,*/}*.{gif,jpeg,jpg,png,webp}",
            "<%= app.dist %>/styles/fonts/{,*/}*.*"
          ]

  grunt.registerTask "serve", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run [
      "clean:server",
      "concurrent:server",
      "autoprefixer",
      "connect:livereload",
      "watch"
    ]

  grunt.registerTask "test", [
    "clean:server",
    "concurrent:test",
    "autoprefixer",
    "connect:test",
    "mocha"
  ]

  grunt.registerTask "build", [
    "clean:dist",
    "useminPrepare",
    "concurrent:dist",
    "autoprefixer",
    "concat",
    "cssmin",
    "uglify",
    "rev",
    "usemin"
  ]

  grunt.registerTask "default", [
    "jshint",
    "test",
    "build"
  ]

