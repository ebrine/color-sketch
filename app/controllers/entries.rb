get "/entries/create" do
  erb :create
end


post "/entries/delete/:entry" do
  id = params[:entry]
  @entry = Entry.find(id)
  @entry.destroy
  redirect '/'
end

get "/entries/:entry" do
  p id = params[:entry]
  @entry = Entry.find(id)
  erb :entries
end


post "/entries/save" do
  Entry.create(title: params[:title], body: params[:body])
  redirect '/'
end

post "/entries/edit" do

end
