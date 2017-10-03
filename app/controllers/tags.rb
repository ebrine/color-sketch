get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb :tag_show
end
