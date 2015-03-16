gulp       = require 'gulp'
sass       = require 'gulp-sass'
watch      = require 'gulp-watch'
plumber    = require 'gulp-plumber'
coffee     = require 'gulp-coffee'
gutil      = require 'gulp-util'

gulp.task 'sass', ->
  gulp.src 'sass/*.sass'
    .pipe plumber()
    .pipe sass indentedSyntax: true
    .pipe gulp.dest 'public/'

gulp.task 'coffee', ->
  gulp.src 'src/*.coffee'
    .pipe plumber()
    .pipe coffee bare: true
    .pipe gulp.dest 'public/'
    .on 'error', gutil.log

gulp.task 'watch', ->
  watch 'sass/*.sass', -> gulp.start 'sass'
  watch 'src/*.coffee', -> gulp.start 'coffee'

gulp.task 'default', ['sass', 'coffee', 'watch']
