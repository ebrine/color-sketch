get '/' do
  @posts = Post.all
  erb :index
end

get '/:id' do
  article_to_find = params[:id]
  @current_id = article_to_find.to_i
  @article = Post.find_by(id: article_to_find.to_i)
  erb :index
end

get '/new_entry' do
  erb :new_entry
end

post '/new_entry' do
  title = params[:title]
  article = params[:article]
  Post.create(title: title, article: article)
  redirect '/'
end

get '/:id/edit_entry' do
  article_to_find = params[:id]
  @current_id = article_to_find.to_i
  @article = Post.find_by(id: article_to_find.to_i)
  erb :edit_entry
end