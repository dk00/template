import
  redux: {combine-reducers}

empty = {}
function handle-actions handlers, default-state=empty
  (state, {type, payload}) ->
    if handlers[type]? state, payload then Object.assign {} state, that
    else state || default-state

function merge-data state, {key, items}
  update = items.map (values) -> (values.id): values
  (key): Object.assign {} state[key], ...update

function compose-reduce
  handlers =
    data: handle-actions load: merge-data
  combine-reducers handlers

export default: compose-reduce
