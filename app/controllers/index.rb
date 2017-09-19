get '/' do
  @posts = Post.all.sort_by &:created_at
  erb :index
end

get '/:id' do
    article_to_find = params[:id]
    @current_id = article_to_find.to_i
    @article = Post.find_by(id: article_to_find.to_i)
  #need to create a 404 page
  erb :index
end

get '/new_entry/' do
  erb :new_entry
end

post '/new_entry' do
  title = params[:title]
  article = params[:article]
  tag = params[:tags]
  Post.create(title: title, article: article) << Tag.create(tag: tag)
  # redirect '/'
end

get '/:id/edit_entry' do
  article_to_find = params[:id]
  @current_id = article_to_find.to_i
  @article = Post.find_by(id: article_to_find.to_i)
  erb :edit_entry
end

post '/:id/edit_entry' do
  id = params[:id]
  post_to_update = Post.find(id)
  title = params[:title]
  article = params[:article]
  post_to_update.update(title: title, article: article)
  redirect "/#{id}"
end

get '/:id/delete_entry' do
  id = params[:id]
  @article = Post.find(id)
  Post.find(id).destroy
  erb :delete_entry
end