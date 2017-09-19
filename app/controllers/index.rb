get '/' do
  @entries = Blog.find(1).entries
  erb :index
end

get '/new_entry' do
  erb :new_entry
end

post '/new_entry' do
  Entry.create(blog_id: 1, title: params[:title], article: params[:article])
  redirect '/'
end
