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

  pending 'post /entries returns a 302 status code' do
    entry_example = Entry.new(
      author: "El Loko",
      title: "Ramblings of el Loko",
      body: "qohenazut oierhb aiut iqjvh wea rzoo")

    entry_example.save
    post '/entries'
    expect(last_response.status).to eq(302)
  end

end
