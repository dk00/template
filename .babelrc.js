module.exports = {
  presets: ['@babel/stage-0'],
  plugins: [
    'livescript',
    ['@babel/transform-react-jsx', {pragma: 'h', useBuiltIn: true}],
    'transform-component-name'
  ]
}
