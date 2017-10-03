get '/entries' do
  @entries = Entry.all
  erb :index
end

get '/entry/:id' do
  @entry = Entry.find(params[:id])
  erb :show
end
