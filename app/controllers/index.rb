get '/' do
  @entries = Blog.find(1).entries
  erb :index
end
