get '/' do
  @entries = Entry.all
  erb :index
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

def edit_entry
  blog = Entry.find(params[:id])
  blog.body = params[:body]
  redirect "/entries/#{blog.id}"
end

patch '/entries/:id' do
  edit_entry
end

put '/entries/:id' do
  edit_entry
end
