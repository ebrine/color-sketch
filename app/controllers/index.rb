get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/list_all' do
  @all_entries = Entry.all
  erb :list_all
end

get '/show_entry' do
  erb :show_entry
end

get '/create' do
  erb :create
end

post '/create' do
  @title = params[:title]
  @body = params[:body]
  @tags = params[:tags]
  @tags = @tags.split(", ")
  entry = Entry.create(title: @title, body: @body)
  @tags.each do |tag_string|
    tag = Tag.find_or_create_by(category: tag_string)
    entry.tags << tag
  end
  redirect to('/create')
end

get '/update' do

end

post '/update' do

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

get '/tags' do

end

post '/tags' do

end
