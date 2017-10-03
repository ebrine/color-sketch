get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/entries' do
  @entries = Entry.all
  erb :list_all
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  @tags = @entry.tags
  erb :'/entries/show'
end

get '/entries/new' do
  erb :create
end

post '/entries' do
  @title = params[:title]
  @body = params[:body]
  @tags = params[:tags]
  @tags = @tags.split(", ")
  entry = Entry.create(title: @title, body: @body)
  @tags.each do |tag_string|
    tag = Tag.find_or_create_by(category: tag_string)
    entry.tags << tag
  end
  redirect to('/entries/new')
end


put '/entries/:id' do

end


delete '/entries/:id' do
  @entry_id = params[:entry_id]
  entry = Entry.find_by(id: @entry_id)
  entry.delete
  redirect to('/entries')
end

get '/tags' do
  @all_tags = Tag.all.sort{|a, b| a.category <=> b.category}
  erb :list_tags
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @entries = @tag.entries
  erb :'/tags/show'
end
