require_relative '../spec_helper'

describe "Entries Controller" do
  let!(:test_entry) { Entry.create(
      author: "Anonymous Ace",
      title: "There be dragons here!",
      body: "I like training my dragon"
    )}

  it '/entries returns a 200 status code' do
    get '/entries'
    expect(last_response.status).to eq(200)
  end

  it 'entries/new returns a 200 status code' do
    get '/entries/new'
    expect(last_response.status).to eq(200)
  end

  it 'post /entries creates a new entry' do
    post '/entries', {entry: {author: "El Loko", title: "Ramblings of el Loko", body: "qohenazut oierhb aiut iqjvh wea rzoo"}}
    expect(Entry.find_by(author: "El Loko")).to_not be_nil
  end

  it 'entries/show returns a 200 status code' do
    get "/entries/#{test_entry.id}"
    expect(last_response.status).to eq(200)
  end

  it 'entries/edit returns a 200 status code' do
    get "entries/#{test_entry.id}/edit"
    expect(last_response.status).to eq(200)
  end

  it 'put /entry edits a new entry' do
    put "/entries/#{test_entry.id}", {entry: {author: "Don Quixote"}}
    find_entry = Entry.find(test_entry.id)
    expect(find_entry.author).to eq("Don Quixote")
  end

  it 'deletes /entries/:id for an entry' do
    expect { delete "/entries/#{test_entry.id}" }.to change { Entry.all.length }.by -1
  end
end
