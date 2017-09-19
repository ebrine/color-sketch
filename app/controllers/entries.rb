get '/entry/:id/edit' do
  @current_entry = Entry.find(params[:id])
  erb :edit_entry
end

get '/entry/:id' do
  @current_entry = Entry.find(params[:id])
  erb :entry
end
