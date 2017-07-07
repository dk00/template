import \./link : {link, h}

function counter-state
  it.counter

function counter-props state, dispatch
  Object.assign {} state,
    inc: -> dispatch type: \inc
    dec: -> dispatch type: \dec

function render-counter {inc, dec, value=\?}
  h \div,,
    h \button on-click: dec, \-
    value
    h \button on-click: inc, \+

Counter = link render-counter, counter-state, counter-props

export default: Counter
