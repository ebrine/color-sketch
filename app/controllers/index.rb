get '/' do
  @posts = Post.all.sort_by &:created_at
  erb :index
end

