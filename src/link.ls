import \./vendor : {h, Component, render, link: compose-link}

link = compose-link {Component}

function mount {
  store=mount.store, component, container=document.query-selector \#root
}
  app = h (link component), {store}
  mount.store = store
  mount.root = render app, container,
  mount.root || container.first-element-child

export {default: link, link, h, render, mount}
