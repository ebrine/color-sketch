enable :sessions

get '/entry/:id' do
  @current_entry = Entry.find(params[:id])
  @errors = session[:errors]
  erb :entry
end

get '/entry/:id/edit' do
  @current_entry = Entry.find(params[:id])
  erb :edit_entry
end

post '/entry/:id/edit' do
  session[:errors] = []
  entry = Entry.find(params[:id])
  entry.title = params[:title]
  entry.body = params[:body]
  entry.updated_at = DateTime.now
  if entry.valid?
    entry.save
  else
    session[:errors] = entry.errors.full_messages
  end
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
  @errors = session[:errors]
  erb :new_tag
end

post '/entry/:id/new_tag' do
  session[:errors] = []
  entry = Entry.find(params[:id])
  tag_name = params[:tag]
  if tag_name =~ /\W/
    session[:errors] << "Tag name must only include alphabetic characters."
  end
  tag = Tag.new({tag_name: tag_name})
  session[:errors] += tag.errors.full_messages
  if session[:errors] == []
    entry.tags << tag
  end
  redirect to("/entry/#{entry.id}")
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
