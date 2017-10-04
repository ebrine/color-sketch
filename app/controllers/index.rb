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

# show -->
get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :'entries/show'
end

# edit -->

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :'entries/edit'
end

# update -->

# delete -->
