path = require \path
webpack = require \webpack
HtmlPlugin = require \html-plugin
public-path = path.join __dirname, \www
mode = if process.argv.slice 1 .join ' ' .includes \webpack-dev-server
  \development
else \production

style-file = if mode == \production
  * * loader: \file-loader options: name: '[name].css'
    \extract-loader
else [\style-loader]
style-options = source-map: true minimize: mode == \production

base =
  mode: mode
  entry: \./src/index.ls
  module: rules:
    * use: \babel-loader
      test: /\.(ls|jsx|js)$/
      exclude: /node_modules/

    * test: /\.(sass|scss)$/
      use: style-file.concat <[css-loader sass-loader]>map ->
        loader: it, options: style-options
  resolve: extensions: <[.ls .jsx .js .sass .scss]>

require \./register <| {}
html-options =
  title: \Template content: require \./src/render-static .default
  theme-color: try require \./www/manifest.json .theme_color

base-plugins = [new HtmlPlugin html-options]

start-list = [\/ \/?utm_source=homescreen]
function include-start
  {revision} = it.find -> /index\.html/test it.url
  start-list.map (-> {url: it, revision}) .concat it

modes =
  development: ->
    plugins:
      ...base-plugins
      new webpack.HotModuleReplacementPlugin
    dev-server:
      content-base: public-path
      hot: true
      history-api-fallback: true
      host: \0.0.0.0

  production: ->
    MinifyPlugin = require \babel-minify-webpack-plugin
    WorkboxPlugin = require \workbox-webpack-plugin
    rewrites = \module.hot : \false

    entry: \./src/index.ls
    output: path: public-path
    plugins:
      new webpack.DefinePlugin rewrites
      ...base-plugins
      new WorkboxPlugin options =
        sw-dest: "#public-path/sw.js"
        navigate-fallback: \/
        glob-patterns: ['**\/*']
        glob-ignores: '**\/*.map'
        manifest-transforms: [include-start]

    optimization:
      runtime-chunk: \single
      split-chunks:
        chunks: \all
        automatic-name-delimiter: \.
      minimizer: [new MinifyPlugin]

export Object.assign {} base, modes[mode]!
