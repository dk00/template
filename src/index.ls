import
  redux: {create-store}
  \./link : {link, render}
  \./reduce : compose-reduce
  \./preload-state : preload-state
  \./main : main

function start
  navigator.service-worker?register \service-worker.js
  enhancer = window.__REDUX_DEVTOOLS_EXTENSION__?!
  store = create-store compose-reduce!, preload-state!, enhancer

  root = void
  container = document.query-selector \#root
  init = ->
    seed = link it
    root := render (seed {store}), container, root
  init main

  if module.hot
    require \../style/index.sass
    require \preact/devtools
    that.accept \./src/reduce.ls ->
      store.replace-reducer <| require \./reduce .default!
    that.accept \./src/main.jsx ->
      init <| require \./main .default

start!
