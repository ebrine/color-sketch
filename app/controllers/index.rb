get '/' do
  @entries = Entry.all
  erb :index
end

# post '/entries' do
#   blog = Entry.create(title: params[:title], body: params[:body])
#   blog.tags << Tag.find_or_create_by(description: params[:tag])
#   redirect '/'
#
# end

get '/entries/:id' do
  p params
end
