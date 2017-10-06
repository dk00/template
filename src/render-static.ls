import
  \./reduce : reducers
  \./preload-state : preload
  \./main : main
  \linking/preact/ : {render-vdom}

function render-static
  render-vdom {reducers, preload, component: main}

export default: render-static
