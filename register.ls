jsx = [\transform-react-jsx pragma: \h use-built-ins: true]
function register plugins=[]
  require \livescript
  delete require.extensions\.ls
  options = require \./.babelrc.js
  require \babel-register <| Object.assign {} options,
    plugins: plugins ++ [\transform-es2015-modules-commonjs] ++ options.plugins
    extensions: <[.ls .jsx]>

module.exports = register
