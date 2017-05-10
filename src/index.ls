import
  redux: {create-store}
  \./link : {link, render}
  \./reduce : compose-reduce
  \./preload-state : preload-state
  \./main : main

function start
  navigator?service-worker.register \service-worker.js
  enhancer = window.__REDUX_DEVTOOLS_EXTENSION__?!
  store = create-store compose-reduce!, preload-state!, enhancer
  seed = link main
  render (seed {store}), document.query-selector \#root

start!
