path = require \path
target-path = path.join __dirname, \www

export
  entry: \./src/index.ls

  module:
    rules:
      * test: /\.(ls|jsx)$/
        exclude: /node_modules/
        use:
          loader: \babel-loader
          options: require \./.babelrc
      ...

  resolve:
    extensions: [\.ls \.jsx \.js]

  devtool: \cheap-eval-source-map

  plugins:
    * new webpack.HotModuleReplacementPlugin
    ...

  dev-server:
    hot: true
    public-path: \www
