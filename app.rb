require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary.rb')

get("/") do
  @terms = Term.all()
  erb(:index)
end

post("/terms") do
  word = params.fetch("word")
  definition = params.fetch("definition")
  term = Term.new()#moved these arguments to .store()
  term.store(word, definition)
  term.save()
  erb(:submitted)
end
