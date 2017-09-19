get '/' do
  @posts = Entry.all
  erb :index
end

post '/' do
  tag_name = params[:tag]
  if tag_name =~ /\W/
    redirect to("/")
  end
  tag = Tag.create({tag_name: tag_name})
  Entry.create({title: params[:title], body: params[:body], tags: [tag]})
  redirect to("/")
end

post "/search" do
  redirect to("/entry/#{params[:tag_search]}/search")
end
