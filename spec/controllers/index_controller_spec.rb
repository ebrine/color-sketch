require_relative '../spec_helper'

describe "root" do
  it "returns a 302 status code" do
    get '/'
    expect(last_response.status).to eq(302)
  end
end
