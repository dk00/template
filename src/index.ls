import
  \./link : {start-app}
  \../style/index : styles
  \./reduce : reducers
  \./preload-state : preload
  \./main : main

function start
  store = start-app {reducers, preload, component: main}
  navigator.service-worker?register \/sw.js if !module.hot
  if module.hot
    require \preact/devtools
    module.hot.accept \./reduce -> store.replace-reducer reducers
    module.hot.accept \./main -> store.replace-app main

start!
