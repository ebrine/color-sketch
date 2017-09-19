get "/tags/:tag" do
  @tag = Tag.find(params[:tag])
  @entries = @tag.entries
  erb :tags
end
