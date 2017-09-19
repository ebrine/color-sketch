@errors = []
enable :sessions

get '/' do
  @posts = Entry.all
  if session[:errors].length != 0
    @errors = session[:errors]
  end
  erb :index
end

post '/' do
  session[:errors] = []
  tag_name = params[:tag].chomp
  @posts = Entry.all
  if tag_name.match(/[\w\s]*/)[0] != tag_name
    session[:errors] << "Tag name must only include alphabetic characters."
  end
  tag = Tag.create({tag_name: tag_name})
  session[:errors] << tag.errors.full_messages
  e = Entry.create({title: params[:title], body: params[:body], tags: [tag]})
  session[:errors] << e.errors.full_messages
  session[:errors] = session[:errors].flatten
  puts "****************************************"
  puts "#{session[:errors]}"
  redirect to ("/")
end

post "/search" do
  redirect to("/entry/#{params[:tag_search]}/search")
end
