get '/' do
  @entries = Entry.all
  erb :index
end

get '/entries/:id' do
  puts params[:id]
  @entry = Entry.find(params[:id])
  erb :show
end
