get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

get '/entries/new' do
  erb :'entries/new'
end

post '/entries' do
  @entry = Entry.new(params[:entry])
  if @entry.valid?
    @entry.save
    redirect '/entries'
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :'entries/show'
end

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :'entries/edit'
end

put '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.update(params[:entry])
  if @entry.valid?
    @entry.save
    redirect "/entries/#{params[:id]}"
  else
    @errors = @entry.errors.full_messages
    erb :'entries/edit'
  end
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect "/entries"
end
