module.exports = {
  parserOpts: {
    parser: 'livescript-next'
  },
  presets: ['stage-0'],
  plugins: [[
    'transform-react-jsx', {
      pragma: 'h',
      useBuiltIns: true
    }
  ]]
}
