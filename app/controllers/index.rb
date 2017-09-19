get '/' do
  @posts = Entry.all
  erb :index
end

post '/' do
  tag = Tag.create({tag_name: params[:tag]})
  Entry.create({title: params[:title], body: params[:body], tags: [tag]})
  redirect to("/")
end
