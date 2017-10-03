get '/entries' do
  @entries = Entry.all
  erb :'entries/index'
end

get '/entries/new' do
  erb :'entries/new'
end

post '/entries' do
  @entry = Entry.new(params[:entry])
  if @entry.valid?
    @entry.save
    redirect '/entries'
  else
    @errors = @entry.errors.full_messages
    erb :'entries/new'
  end
end
