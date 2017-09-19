get "/entries/create" do
  erb :create
end

post "/entries/delete/:entry" do
  id = params[:entry]
  @entry = Entry.find(id)
  @entry.destroy
  redirect '/'
end

get "/entries/:entry" do
  p id = params[:entry]
  @entry = Entry.find(id)
  erb :entries
end

post "/entries/new" do
  entry = Entry.create(title: params[:title], body: params[:body])
  tags = params[:tags].split(",")
  tags.each do |tag|
    tag_object = Tag.find_or_create_by(name: tag.strip)
    entry.tags << tag_object
  end
  redirect '/'
end

get "/entries/edit/:entry" do
  @entry = Entry.find(params[:entry])
  erb :edit
end

post "/entries/save/:entry" do
  entry = Entry.find(params[:entry])
  entry.title = params[:title]
  entry.body = params[:body]
  tags = params[:tags].split(",")
  tags.each do |tag|
    tag_object = Tag.find_or_create_by(name: tag.strip)
    entry.tags << tag_object
  end
  entry.save
  redirect '/'
end
