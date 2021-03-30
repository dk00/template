import {precacheAndRoute, createHandlerBoundToURL} from 'workbox-precaching'
import {NavigationRoute, registerRoute} from 'workbox-routing'

const precacheManifest = [].concat(
  self.__WB_MANIFEST,
)

precacheAndRoute(precacheManifest)
registerRoute(new NavigationRoute(createHandlerBoundToURL('/index.html')))
