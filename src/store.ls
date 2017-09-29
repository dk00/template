import
  \./vendor : {create-store}
  \./reduce : compose-reduce
  \./preload-state : preload-state

function setup env
  if module.hot
    module.hot.accept \./reduce ->
      store.replace-reducer <| require \./reduce .default!

  store = create-store compose-reduce!, preload-state!,
    env?__REDUX_DEVTOOLS_EXTENSION__?!

export default: setup
