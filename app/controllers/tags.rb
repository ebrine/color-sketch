
get '/tags/:id' do
  @entries = Tag.find(params[:id]).entries
  erb :index
end
