get '/entry/:id/edit' do
  @current_entry = Entry.find(params[:id])
  erb :edit_entry
end

get '/entry/:id' do
  @current_entry = Entry.find(params[:id])
  erb :entry
end

post '/entry/:id' do
  entry = Entry.find(params[:id])
  entry.update_attributes({title: params[:title], body: params[:body],
    updated_at: DateTime.now})
  redirect to("/entry/#{entry.id}")
end
