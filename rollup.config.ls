import
  \rollup-plugin-babel : babel
  \rollup-plugin-node-resolve : node-resolve

resolve = node-resolve jsnext: true extensions: <[.ls .jsx .js]>

babel-options =
  include: <[**/*.jsx **/*.ls **/*.js]>
  parser-opts: parser: \livescript-next
  presets: [\stage-0]
  plugins:
    \external-helpers
    * \transform-react-jsx pragma: \h use-built-ins: true
    \transform-inline-environment-variables

config =
  plugins: [resolve, babel babel-options]
  module-name: require \./package.json .name
  external: Object.keys <| require \./package.json .dependencies
  source-map: true exports: \named use-strict: false

export default: config
