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
  tags = params[:tags].split(",")
  p "-" *300
  p tags
  p "-" *300
  tags.each do |name|
    @entry.tags.each do |tag|
      if tag.name != name
        new_tag = Tag.find_or_create_by(name: name)
        EntriesTag.find_or_create_by(entry: @entry, tag: new_tag)
      end
    end
  end

  @entry.tags.each do |tag|
    name = tag.name
    p name
    if tags.exclude?(name)
    association = EntriesTag.find_by(entry: @entry, tag: tag)
    association.destroy
    end
  end
  redirect "/entries/#{@entry.id}"
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end
