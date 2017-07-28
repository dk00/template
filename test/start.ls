if process.argv.2 then
  (require \../register)!
  require \tape <| require "./#that" .default
else
  require \../register <| plugins: [\istanbul]
  require \./index
