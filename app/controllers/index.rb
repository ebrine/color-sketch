get '/' do
  # Look in app/views/index.erb
  @entries = Entry.all
  
  erb :index
end
