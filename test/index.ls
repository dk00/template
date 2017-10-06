units = {}

require \../register <| plugins: <[istanbul]>
require! tape: test
list = if process.argv.length > 2 then process.argv.slice 2
else Object.keys units
list.for-each (name) ->
  test units[name] || name, (require "./#name" .default)
