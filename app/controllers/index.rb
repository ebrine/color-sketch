get '/' do
  redirect "/entries"
end

get '/entries' do
  erb :'entries/index'
end
