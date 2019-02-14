import {h, stackProvider, startApp, enableHMR} from 'web-app-tools'
import app from './app'

const wrapped = module.hot? enableHMR(app, replaceApp =>
  module.hot.accept('./app', () => replaceApp(app))
): app

startApp(() => h(stackProvider, {}, h(wrapped)))
