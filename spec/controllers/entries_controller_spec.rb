require_relative '../spec_helper'

describe "Entries Controller" do
  let(:test_entry) { Entry.create(
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
    post '/entries', {author: "El Loko", title: "Ramblings of el Loko", body: "qohenazut oierhb aiut iqjvh wea rzoo"}
    expect(Entry.find_by(author: "El Loko")).to_not be_nil
  end

end
