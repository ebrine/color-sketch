get '/' do
  @entries = Entry.all
  erb :index
end

get '/tags/:id' do
  p params.inspect
  @tagged_entries = Tag.find(params[:id])
  erb :tag
end

get '/entries/new' do
  erb :new
end

post '/entries' do
  blog = Entry.create(title: params[:title], body: params[:body])
  blog.tags << Tag.find_or_create_by(description: params[:tag])
  redirect '/'
end

get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end

get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  erb :edit
end

patch '/entries/:id' do
  blog = Entry.find(params[:id])
  blog.body = params[:body]
  blog.save
  redirect "/entries/#{blog.id}"
end

put '/entries/:id' do
  blog = Entry.find(params[:id])
  blog.body = params[:body]
  redirect "/entries/#{blog.id}"
end

delete '/delete/:id' do
  blog = Entry.find(params[:id])
  blog.destroy
  redirect "/"
end
