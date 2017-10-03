get '/entries' do
  @entries = Entry.all
  erb :index
end

get '/entry/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end

get '/entries/new' do
  erb :new
end

post '/entries' do
  p params
  Entry.create(title: params[:title], description: params[:description])
  redirect '/entries'
end
