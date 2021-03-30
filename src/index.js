import {h, render} from 'preact'
import app from './app'

const renderApp = () => render(h(app), document.querySelector('#root'))

if (module.hot) {
  module.hot.accept('./app', renderApp)
}

renderApp()

if (!module.hot) {
    navigator.serviceWorker?.register('/service-worker.js')
}