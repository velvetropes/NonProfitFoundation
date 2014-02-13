"use strict"

module.exports = (grunt) ->
  # time it!
  require("time-grunt") grunt

  # skip the formalities, just load the tasks
  require("load-grunt-tasks") grunt

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    bake:
      server:
        options:
          content: "app/starkey.json",
          section: "server"
        files:
          ".tmp/index.html" : 'app/index.html',
          ".tmp/programs.html" : 'app/programs.html',
          ".tmp/blog.html" : 'app/blog.html',
          ".tmp/media_mentions.html" : 'app/media_mentions.html'
          ".tmp/missions.html" : 'app/missions.html'
      dist:
        options:
          content: "app/starkey.json",
          section: "dist"
        files:
          # API
          "<%= app.dist %>/templates/default_site/api.group/homepage_markers.html" : 'app/api/homepage_markers.tpl',
          "<%= app.dist %>/templates/default_site/api.group/blog.html" : 'app/api/blog.tpl',
          "<%= app.dist %>/templates/default_site/api.group/press.html" : 'app/api/press.tpl',
          "<%= app.dist %>/templates/default_site/api.group/press_releases.html" : 'app/api/press_releases.tpl',
          "<%= app.dist %>/templates/default_site/api.group/media_mentions.html" : 'app/api/media_mentions.tpl',
          "<%= app.dist %>/templates/default_site/api.group/featured_articles.html" : 'app/api/featured_articles.tpl',
          "<%= app.dist %>/templates/default_site/api.group/program_0.html" : 'app/partials/programs/0.html',
          "<%= app.dist %>/templates/default_site/api.group/program_1.html" : 'app/partials/programs/1.html',
          "<%= app.dist %>/templates/default_site/api.group/program_2.html" : 'app/partials/programs/2.html',
          "<%= app.dist %>/templates/default_site/api.group/program_3.html" : 'app/partials/programs/3.html',
          "<%= app.dist %>/templates/default_site/api.group/program_partnerships.html" : 'app/api/program_partnerships.tpl',
          "<%= app.dist %>/templates/default_site/api.group/program_resources.html" : 'app/api/program_resources.tpl',
          "<%= app.dist %>/templates/default_site/api.group/missions_markers.html" : 'app/api/missions_markers.tpl',
          "<%= app.dist %>/templates/default_site/api.group/missions.html" : 'app/api/missions.tpl',
          # Templates
          "<%= app.dist %>/templates/default_site/pages.group/index.html" : 'app/index.html',
          "<%= app.dist %>/templates/default_site/programs.group/index.html" : 'app/programs.html',
          "<%= app.dist %>/templates/default_site/blog.group/index.html" : 'app/blog.html',
          "<%= app.dist %>/templates/default_site/media_mentions.group/index.html" : 'app/media_mentions.html',
          "<%= app.dist %>/templates/default_site/missions.group/index.html" : 'app/missions.html',
     sass:
      dist:
        options:
          loadPath: require('node-neat').includePaths
        files: [
          '.tmp/styles/app.css' : 'app/styles/app.scss'
          ]

    app:
      src: "app"
      dist: "dist"

    watch:
      css:
        files: ['**/*.scss'],
        tasks: ['sass','autoprefixer']

      styles:
        files: ["<%= app.src %>/styles/{,*/}*.css"]
        tasks: ["autoprefixer"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [
          "<%= app.src %>/*.html",
          "<%= app.src %>/*.json",
          "<%= app.src %>/partials/**/*.html",
          ".tmp/styles/{,*/}*.css",
          "{.tmp,<%= app.src %>}/scripts/{,*/}*.js",
          "<%= app.src %>/images/{,*/}*.{gif,jpeg,jpg,png,svg,webp}"
        ]

        tasks: [
          "bake:server"
        ]

      coffee:
        files: ["<%= app.src %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:server"]

    coffee:
      dist:
        files: [
          ".tmp/scripts/main.js" : "app/scripts/**/*.coffee"
        ]
      server:
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
        generatedImagesDir: "<%= app.dist %>/assets/images/generated"

    server:
      options:
        debugInfo: true

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: ["Gruntfile.js", "<%= app.src %>/scripts/{,*/}*.js", "!<%= app.src %>/scripts/vendor/*", "test/spec/{,*/}*.js"]

    useminPrepare:
      options:
        dest: "<%= app.dist %>/"

      html: [
            "<%= app.src %>/*.html",
            "<%= app.src %>/partials/*.html"
          ]

    usemin:
      options:
        assetsDirs: ["<%= app.dist %>"]

      html: ["<%= app.dist %>/**/*.html"]
      css: ["<%= app.dist %>/assets/styles/{,*/}*.css"]

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
      server:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.{gif,jpeg,jpg,png}"
          dest: ".tmp/images"
        ]
      dist:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.{gif,jpeg,jpg,png}"
          dest: "<%= app.dist %>/assets/images"
        ]

    svgmin:
      server:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.svg"
          dest: ".tmp/images"
        ]
      dist:
        files: [
          expand: true
          cwd: "<%= app.src %>/images"
          src: "{,*/}*.svg"
          dest: "<%= app.dist %>/assets/images"
        ]

    # cssmin:
    #   dist:
    #     files: [
    #       expand: true,
    #       cwd: ".tmp/styles",
    #       src: ['*.css', '!*.min.css'],
    #       dest: '<%= app.dist %>/styles',
    #       ext: '.min.css'
    #     ]

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
      ee:
        options:
          force: true
        files: [
          dot: true
          src: [
            "../shared/templates/**",
            "../www/assets/**",
          ]
        ]

      server: ".tmp"

    copy:
      ee:
        files: [
            {
              expand: true,
              cwd: "<%= app.dist %>/templates/",
              src: ['**'],
              dest: '../shared/templates',
            },
            {
              expand: true,
              cwd: "<%= app.dist %>/assets/",
              src: ['**'],
              dest: '../www/assets',
            },
            { #TODO: fix and remove
              expand: true,
              cwd: "app/styles/fonts/",
              src: ['**'],
              dest: '../www/assets/styles/fonts/',
            },
            { #TODO: fix and remove
              expand: true,
              cwd: "app/styles/images/",
              src: ['**'],
              dest: '../www/assets/styles/images/',
            },
            { #TODO: fix and remove
              expand: true,
              cwd: "app/partials/",
              src: ['**'],
              dest: '../www/partials/',
            }
        ]

      images:
        expand: true
        dot: true
        cwd: "<%= app.src %>/images"
        dest: ".tmp/images/"
        src: "{,*/}*.{gif,jpeg,jpg,png,svg,webp}"

    concurrent:
      server: [
        "coffee:server",
        "sass",
        "copy:images"
      ]
      test: []
      dist: [
        "coffee:dist"
        "sass"
        'imagemin'
        'svgmin'
      ]

    uglify:
      options:
        mangle: false

    rev:
      dist:
        files:
          src: [
            "<%= app.dist %>/assets/scripts/{,*/}*.js",
            "<%= app.dist %>/assets/styles/{,*/}*.css",
            "<%= app.dist %>/assets/images/{,*/}*.{gif,jpeg,jpg,png,webp}",
            "<%= app.dist %>/assets/styles/fonts/{,*/}*.*"
          ]

  grunt.registerTask "serve", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run [
      "clean:server",
      "bake:server",
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
    "coffee:dist",
    "concurrent:dist",
    "autoprefixer",
    "bake:dist",
    "useminPrepare",
    "concat",
    "cssmin",
    "uglify",
    "rev",
    "usemin",
    "clean:ee",
    "copy:ee"
  ]

  grunt.registerTask "default", [
    "jshint",
    "test",
    "build"
  ]

