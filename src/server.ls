import express

app = express!
app.use express.static \www

{PORT} = process.env
app.listen PORT
