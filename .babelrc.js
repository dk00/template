module.exports = {
  parserOpts: {
    parser: 'livescript-next'
  },
  presets: ['stage-0'],
  plugins: [
    'transform-component-name',
    ['transform-react-jsx', { pragma: 'h', useBuiltIns: true } ]
  ]
}
