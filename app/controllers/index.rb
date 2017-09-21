get '/' do
  redirect '/list_all'
end

get '/list_all' do
  @all_entries = Entry.all
  erb :list_all
end

get '/list_all/:id' do
  @entry = Entry.find(params[:id])
  erb :view_one
end

get '/create' do
  erb :create
end

post '/create' do
  @title = params[:title]
  @body = params[:body]
  entry = Entry.create(title: @title, body: @body)
  @errors = entry.errors
  p @errors
  if @errors
    status 422
    @messages = entry.errors.full_messages
    erb :create
  else 
    entry.save
    @tags = params[:tags]
    @tags = @tags.split(", ")
    @tags.each do |tag_string|
      tag = Tag.find_or_create_by(category: tag_string)
      @entry.tags << tag
    end
    redirect to('/list_all')
  end
  
end

get '/update' do
  @all_entries = Entry.all
  erb :update
end

post '/update' do
  @entry_id = params[:entry_id]
  @field_selection = params[:field_selection]
  @new_data = params[:field_value]
  post = Entry.find_by(id: @entry_id)
  if @field_selection == "tags"
    tag_array = @new_data.split(' ')
    tag_array.each do |tag|
      post.tags << Tag.find_or_create_by(category: tag)
    end
  else
    post.update_attribute(@field_selection.to_s, @new_data)
  end
  redirect to('/update')
end

get '/delete' do
  @all_entries = Entry.all
  erb :delete
end

post '/delete' do
  @entry_id = params[:entry_id]
  entry = Entry.find_by(id: @entry_id)
  entry.delete
  redirect to('/delete')
end

get '/list_tags' do
  @all_tags = Tag.all
  erb :list_tags
end

post '/list_tags' do
  tag_id = params[:tag_id]
  tag = Tag.find_by(id: tag_id)
  @all_entries = tag.entries
  erb :list_all
end
