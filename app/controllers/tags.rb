get "/tags/:tag" do
  @tag = Tag.find(params[:tag])
  @entries = Entry.where(tags.include?(@tag))
  erb :tags
end
