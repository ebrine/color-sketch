get '/entry/:id' do
  @current_entry = Entry.find(params[:id])
  erb :entry
end
