import preact: {h}

function style => h \link rel: \stylesheet href: it
function script => h \script src: it
function head-template {title, meta={} styles=[] scripts=[]}
  h \head,,
    ...styles.map style
    ...scripts.map script
    h \title,, title
    h \meta charset: \utf-8
    Object.keys meta .map (name) ->
      h \meta {name, content: meta[name]}
    h \link rel: \manifest href: \manifest.json

function render-html {head, body: {styles=[] scripts=[]}=[]}
  h \html,, (head-template head), h \body,,
    ...(body.styles || [])map style
    body.content
    ...(body.scripts || [])map script

head =
  title: \Template
  meta:
    \mobile-web-app-capable : \yes
    \theme-color : \#000
    \apple-mobile-web-app-capable : \yes
    \apple-mobile-web-app-status-bar-style : \black
    \viewport : 'width=device-width, initial-scale=1.0, maximum-scale=1.0'

body =
  content: h \div id: \root
  styles: <[/index.css]>
  scripts: <[/index.js]>

function template => render-html {head, body}

export {default: template, render-html}
