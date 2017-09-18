get '/entries' do
  @entries = Entry.all
  p @entries
  erb :entries
end
