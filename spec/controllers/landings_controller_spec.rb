require 'spec_helper'

describe 'LandingsController' do
  describe 'index' do
    it 'responds with a 302' do
      get '/'
      expect(last_response.status).to eq(302)
    end
  end
end
