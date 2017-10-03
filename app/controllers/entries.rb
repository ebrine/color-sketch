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
  tags =  tags.collect { |tag| tag.strip }
  tags = tags.reject { |tag| tag.empty? }
  p "-" *300
  p tags
  p "-" *300
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
  tags =  tags.collect { |tag| tag.strip }
  tags = tags.reject { |tag| tag.empty? }
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

  to_delete = []
  @entry.tags.each do |tag|
    name = tag.name
    if tags.exclude?(name)
      to_delete << name
    end
  end

  to_delete.each do |name|
    @entry.tags.delete(Tag.find_by(name: name))
  end

  # @entry.tags.each do |tag|
  #   name = tag.name
  #   p '#' * 100
  #   p name
  #   if tags.exclude?(name)
  #     @entry.tags.delete(tag)
  #   end
  #   p @entry.tags
  #   p '#' * 100
  # end

  redirect "/entries/#{@entry.id}"
end

delete '/entries/:id' do
  @entry = Entry.find(params[:id])
  @entry.destroy
  redirect '/entries'
end
