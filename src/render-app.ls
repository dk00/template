import
  \./link : {h, link}
  \./store : setup-store
  \./main : main

function render-app => h (link main), store: setup-store!

export default: render-app
