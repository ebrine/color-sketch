get '/' do
  redirect "/entries"
end

# index -->
get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

# new -->
get '/entries/new' do
  erb:'entries/new'
end

# post new -->
post '/entries' do
  @entry = Entry.create(params[:entry])
  redirect "/entries"
end
