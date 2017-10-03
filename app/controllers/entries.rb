get '/entries' do
  @entries = Entry.all
  erb :index
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end

get '/entries/new' do
  erb :new
end

post '/entries' do
  p params
  entry = Entry.create(title: params[:title], description: params[:description])
  tag = Tag.find_or_create_by(name: params[:tag])
  EntriesTag.create(entry: entry, tag: tag)
  redirect '/entries'
end

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :edit
end

put '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.update_attributes(title: params[:title], description: params[:description])
  redirect "/entries/#{@entry.id}"
end
