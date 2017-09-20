get '/' do
  @entries = Entry.all
  erb :index
end

post '/entries' do
  Entry.create(title: params[:title], body: params[:body])
  redirect '/'

end
