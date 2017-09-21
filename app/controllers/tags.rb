# show all
get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

# new
get '/tags/new' do
  erb :'/tags/new'
end

# create
post '/tags' do
  @entry = Tag.new(params[:entry])
  if @entry.valid?
    @entry.save
    redirect "tags/#{@entry.id}"
  else
    @errors = @entry.errors.full_messages
    erb :'/tags/new'
  end
end
