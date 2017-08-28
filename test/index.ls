import tape: test

cases = {}

function main
  Object.entries cases .for-each ([path, name]) ->
    fn = require "./#path" .default
    test name, fn

main!
