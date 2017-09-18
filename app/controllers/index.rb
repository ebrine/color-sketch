get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/list_all' do
  @all_entries = Entry.all 
  erb :list_all
end

get '/show_entry' do
  erb :show_entry
end

get '/create' do
  erb :create
end

post '/create' do
 # redirect
end

get '/update' do

end

post '/update' do

end

get '/delete' do

end

post '/delete' do

end

get '/tags' do

end

post '/tags' do

end
