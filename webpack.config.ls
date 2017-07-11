path = require \path
webpack = require \webpack
public-path = path.join __dirname, \www

export
  entry: \./src/index.ls

  module:
    rules:
      * test: /\.(ls|jsx)$/
        exclude: /node_modules/
        use: loader: \babel-loader options: require \./.babelrc
      * test: /\.sass$/
        use: <[style-loader css-loader sass-loader]>

  resolve:
    extensions: [\.ls \.jsx \.js]

  devtool: \cheap-eval-source-map

  plugins:
    new webpack.HotModuleReplacementPlugin
    ...

  dev-server:
    content-base: public-path
    hot: true
