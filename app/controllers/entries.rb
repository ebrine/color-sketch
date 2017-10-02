get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

get '/entries/new' do
  erb :'entries/new'
end
