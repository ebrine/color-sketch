get '/' do
  @entry_id = params[:id]
  # show a single entry with entry_id
  # need a view that will show info about selected entry
  # page will have home button to go back to index
  # has a link to edit page
  # has a link to delete entry
  # should link to the tag pages for each tag
end

post '/entry' do
  # create a new entry
  # tag the entry with relevant tags
end

patch '/edit' do
  # updates the entry
end

patch '/delete' do
  # deletes the selected entry
end
