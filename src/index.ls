import
  \./link : {mount}
  \./store : setup-store
  \../style/index : styles
  \./main : main

function start
  navigator.service-worker?register \/sw.js
  if module.hot
    require \preact/devtools
    module.hot.accept \./main ->
      mount <| component: require \./main .default
  mount store: setup-store!, component: main

start!
