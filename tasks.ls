import
  fs: {write-file}
  \node-sass : sass
  \preact-render-to-string : render
  rollup: {rollup}
  \browser-sync : {create}

function write name, content
  new Promise (resolve) -> write-file name, content, resolve

function render-sass options
  new Promise (resolve, reject) ->
    err, result = {} <- sass.render options
    switch
    | /unreadable/test err?message => resolve render-sass options
    | err => reject that
    | _ => resolve result

function build-style options
  {out-file, source-map} = options
  render-sass options .then ({css, map}) ->
    Promise.all [[out-file, css] [source-map, map]]map ([name, content]) ->
      write name, content.to-string!

function build-template {entry, dest}
  delete require.cache[require.resolve entry]
  write "#dest" '<!DOCTYPE html>\n' + render (require entry .default!)

cache = {}
function build target
  {entry, dest} = target
  config = require \./rollup.config .default
  options = Object.assign cache: cache[entry], config, target
  rollup options .then -> (cache[entry] = it)write target
  .catch ->
    cache[entry] = void
    Promise.reject it

output-path = \www
style-entries = <[index]>
function style
  Promise.all style-entries.map (name) ->
    out-file = "#output-path/#name.css"
    build-style options = {out-file, output-style: \compact} <<<
      file: "style/#name.sass" source-map: "#out-file.map"

templates = index: \./src/template.ls
function template
  Promise.all <| Object.keys templates .map ->
    build-template entry: templates[it], dest: "#output-path/#it.html"

function app
  build entry: \src/index.ls dest: "#output-path/index.js" format: \iife

function worker
  build entry: \src/service-worker.ls format: \iife \
    dest: "#output-path/service-worker.js"

function server
  build entry: \src/server.ls dest: \server.js format: \cjs

function dev
  create!init {-open, server: output-path} <<<
    files: ["#output-path/*.css" "#output-path/*.js" "#output-path/*.html"]
    ghost-mode: {-clicks, -scroll, -forms}

export {style, template, app, worker, dev, server}
