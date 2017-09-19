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

get '/single_entry/:id' do
  @for_now = Entry.find_by(id: params[:id])
  erb :single_entry
end

post '/update_title' do

end
