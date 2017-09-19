get '/entry/' do
  @entry_id = params[:entry_id]
  # show a single entry with entry_id
  # need a view that will show info about selected entry
  # page will have home button to go back to index
  # has a link to edit page
  # has a link to delete entry
  # should link to the tag pages for each tag

  entry = Entry.find(@entry_id)
  @entry_title = entry.title
  @entry_author = entry.author
  @entry_body = entry.body
  @entry_tags = entry.tags.map {|tag| tag.name}
  erb :entry
end

get '/publish' do
  @tag_names = Tag.all.map do |tag|
    tag.name
  end
  erb :entry_form
end

post '/publish' do
  title = params[:title]
  author = params[:author]
  body = params[:body]
  new_entry = Entry.create(title: title, author: author, body: body)

  @tag_names = Tag.all.map do |tag|
    tag.name
  end

  @tag_names.each do |name|
    if params[name.to_sym] == "on"
      new_entry.tags << Tag.all.find_by(name: name)
    end
  end

  if params[:other]
    new_entry.tags << Tag.create(name: params[:other])
  end

  redirect '/'
end

post '/edit' do
  # updates the entry
  @tag_names = Tag.all.map do |tag|
    tag.name
  end
  @entry_id = params[:entry_id]
  entry = Entry.find(@entry_id)
  @entry_title = entry.title
  @entry_author = entry.author
  @entry_body = entry.body
  @entry_tag_names = entry.tags.map { |tag| tag.name }
  @other_tags = @tag_names - @entry_tag_names
  erb :edit_form
end

post '/update' do
  entry = Entry.find(params[:entry_id])
  entry.title = params[:title]
  entry.author = params[:author]
  entry.body = params[:body]

  @tag_names = Tag.all.map do |tag|
    tag.name
  end

  entry.tags = []

  if @tag_names
    @tag_names.each do |name|
      if (params[name.to_sym] == "on")
        entry.tags << Tag.all.find_by(name: name)
      end
    end
  end

  if (params[:other_tag_entry] != "") && (@tag_names.include?params[:other_tag_entry] ==false)
    entry.tags << Tag.create(name: params[:other_tag_entry])
  end
  
  entry.save
  redirect '/'
end

post '/delete' do
  @entry_id = params[:entry_id]
  entry_to_delete = Entry.find(@entry_id)
  entry_to_delete.destroy
  erb :deleted_form
end
