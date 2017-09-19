get '/' do
  # Look in app/views/index.erb

  # this should go to the homepage
  # which lists all entries
  @all_entries = Entry.all
  erb :index
end
