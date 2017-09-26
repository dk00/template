units = {}

require \../register <| plugins: <[istanbul]>
require! tape: test
list = if process.argv.2 then that.split ' ' else  Object.keys units
list.for-each (name) ->
  test units[name] || name, (require "./#name" .default)
