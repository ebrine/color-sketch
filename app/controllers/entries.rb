get '/' do
  @entries = Entry.all
  erb :index
end

get '/entries/new' do
  erb :new
end

post '/entries/create' do
  @entry = Entry.new(params[:entry])
  if @entry.valid?
    @entry.save
    redirect "entries/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :new
  end
end

get '/entries/edit/:id' do
  @entry = Entry.find(params[:id])
  erb :edit
end

get '/entries/delete/:id' do
  Entry.find(params[:id]).delete
  redirect '/'
end

post '/entries/update/:id' do
  Entry.find(params[:id]).update(params[:entry])
  redirect "/entries/#{params[:id]}"
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end
