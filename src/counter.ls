import \./link : {link, h}

function counter-state
  it.counter

function counter-props state, bind-action
  Object.assign {} state,
    inc: bind-action type: \inc
    dec: bind-action type: \dec

function render-counter {inc, dec, value=\?}
  h \div,,
    h \button on-click: dec, \-
    value
    h \button on-click: inc, \+

counter = link render-counter, counter-state, counter-props

reduce =
  inc: ({value=0}) -> value: value + 1
  dec: ({value=0}) -> value: value - 1

export {default: counter, reduce}
