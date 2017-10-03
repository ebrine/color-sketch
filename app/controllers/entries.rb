get '/entries' do
  @entries = Entry.all
  erb :index
end

get '/entries/new' do
  erb :new
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end

post '/entries' do
  entry = Entry.create(title: params[:title], description: params[:description])
  tags = params[:tags].split(",")
  tags.each do |tag|
    new_tag = Tag.find_or_create_by(name: tag)
    EntriesTag.create(entry: entry, tag: new_tag)
  end
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

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end
