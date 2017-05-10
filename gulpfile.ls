require! gulp
(require \./register)!

tasks = require \./tasks
Object.keys tasks .map ->
  name = it.replace /([a-z])([A-Z])/ '$1-$2' .to-lower-case!
  gulp.task name, tasks[it]

gulp.task \watch ->
  gulp.watch \style/**/*.sass <[style]>
  gulp.watch \src/template.ls <[template]>
  gulp.watch \src/** <[app]>

gulp.task \b <[style template app worker server]>
gulp.task \default <[b watch dev]>
