function add-listener name, handler
  self.add-event-listener name, -> it.wait-until handler it

add-listener \push ->
  options = body: it.data?text! || 'no payload'
  self.registration.show-notification 'Service Worker' options
