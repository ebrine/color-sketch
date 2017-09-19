get '/entry/:id' do
  @entry = Entry.find(params[:id])
  
  erb :entries
end
