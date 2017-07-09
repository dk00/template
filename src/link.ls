import
  preact: {h, Component, render}
  linking: create-link

function class-creator Component => (proto) ->
  function ctor =>
  ctor:: = Object.assign (Object.create Component::), proto,
     constructor: ctor
  Object.assign ctor, proto{display-name}

create-class = class-creator Component
link = create-link {create-class, create-element: h, PropTypes: any: true}

export {default: link, link, h, render}
