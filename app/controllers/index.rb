get '/' do
  @posts = Post.all
  if params.any?
    article_to_find = params[:id]
    @article = Post.find_by(id: article_to_find.to_i)
  end
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

get '/edit_entry' do

  erb :edit_entry
end