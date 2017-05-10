jsx = [\transform-react-jsx pragma: \h use-built-ins: true]
function register plugins=[]
  require \livescript
  delete require.extensions\.ls
  require \babel-register <| babel-options =
    parser-opts: parser: \livescript-next
    presets: <[stage-0]>
    plugins: plugins ++ [\transform-es2015-modules-commonjs jsx]
    extensions: <[.ls .jsx]>

module.exports = register
