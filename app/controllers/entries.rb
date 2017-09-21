# show all
get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

# new
get '/entries/new' do
  erb :'/entries/new'
end

# create
post '/entries' do
  @entry = Entry.new(params[:entry])
  if @entry.valid?
    @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'/entries/new'
  end
end

# show
get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :'/entries/show'
end

#edit
get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :'/entries/edit'
end

# edit
patch '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.update(params[:entry])
  redirect "entries/#{@entry.id}"
end

# delete
delete '/entries/:id' do
  Entry.delete(params[:id])
  redirect "entries"
end
