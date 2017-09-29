import
  \./link : {mount}
  \./store : setup-store
  \../style/index : styles
  \./main : main

function start
  navigator.service-worker?register \/sw.js
  if module.hot
    require \preact/debug
    module.hot.accept \./main ->
      mount <| component: require \./main .default
  mount component: main, store: setup-store window

start!
