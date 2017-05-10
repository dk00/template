import
  preact: {h, Component, render}
  linking: create-link

function class-creator Component => (proto) ->
  function ctor =>
  properties = Object.keys proto .map (key) ->
    (key): {value: proto[key], +writable, +configurable}
  ctor:: = Object.create Component::,
    Object.assign constructor: ctor, ...properties
  ctor

create-class = class-creator Component
link = create-link {create-class, create-element: h, PropTypes: any: true}

export {default: link, link, h, render}

