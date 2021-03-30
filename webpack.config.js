const path = require('path')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const {InjectManifest} = require('workbox-webpack-plugin')

const babelLoader = {
  use: 'babel-loader',
  test: /\.(ls|js|jsx|ts|tsx)$/,
  exclude: /node_modules/,
}

const cssLoaderDev = {
  test: /\.s[ac]ss$/i,
  use: ['style-loader', 'css-loader', 'sass-loader'],
}

const cssLoader = {
  test: /\.s[ac]ss$/i,
  use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
}

const htmlPlugin = new HtmlWebpackPlugin({
  template: 'public/index.html'
})

const entry = './src/index.js'

module.exports = (_, {mode = 'development'}) =>
  mode === 'production'
    ? {
        mode,
        entry,
        output: {
          path: path.resolve('./build'),
        },
        resolve: {
          extensions: ['.ls', '.jsx', '.js', '.sass', '.scss'],
          mainFields: ['module', 'main'],
        },
        module: {
          rules: [babelLoader, cssLoader],
        },
        plugins: [
          new webpack.DefinePlugin({'module.hot': 'false'}),
          new MiniCssExtractPlugin(),
          htmlPlugin,
          new InjectManifest({
            swSrc: './src/service-worker.js',
          }),
        ],
        optimization: {
          runtimeChunk: 'single',
          splitChunks: {
            chunks: 'all',
            automaticNameDelimiter: '.',
          },
        },
      }
    : {
        mode,
        entry,
        devServer: {
          contentBase: './build',
          hot: true,
          historyApiFallback: true,
          host: '0.0.0.0'
        },
        resolve: {
          extensions: ['.ls', '.jsx', '.js', '.sass', '.scss'],
          mainFields: ['module', 'main'],
        },
        module: {
          rules: [babelLoader, cssLoaderDev],
        },
        plugins: [htmlPlugin],
      }
