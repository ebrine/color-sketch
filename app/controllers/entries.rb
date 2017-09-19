get '/entry/:id' do
  @current_entry = Entry.find(params[:id])
  erb :entry
end

get '/entry/:id/edit' do
  @current_entry = Entry.find(params[:id])
  erb :edit_entry
end

post '/entry/:id/edit' do
  entry = Entry.find(params[:id])
  entry.update_attributes({title: params[:title], body: params[:body],
    updated_at: DateTime.now})
  redirect to("/entry/#{entry.id}")
end

get '/entry/:id/delete' do
  @current_entry = Entry.find(params[:id])
  erb :delete
end

post '/entry/:id/delete' do
  entry = Entry.find(params[:id])
  entry.destroy
  redirect to("/")
end

get '/entry/:id/new_tag' do
  @current_entry = Entry.find(params[:id])
  erb :new_tag
end

post '/entry/:id/new_tag' do
  entry = Entry.find(params[:id])
  tag_name = params[:tag]
  if tag_name =~ /\W/
    redirect to("/entry/#{entry.id}")
  else
    tag = Tag.create({tag_name: tag_name})
    entry.tags << tag
    redirect to("/entry/#{entry.id}")
  end
end

get '/entry/:tag_name/search' do
  @search_query = params[:tag_name]
  @tag_name = Tag.find_by({tag_name: params[:tag_name]})
  if @tag_name == nil
    @tag_name = ""
  else
    @tag_name = @tag_name.tag_name
  end
  erb :show_tags
end
