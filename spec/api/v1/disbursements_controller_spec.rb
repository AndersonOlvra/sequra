require 'rails_helper'

RSpec.describe '/api/v1/disbursements', type: :request do
    let(:disbursements_api_path) { '/api/v1/disbursements' }

    describe 'GET /disbursements' do
        context "without merchant informed" do
            it 'fetches all disbursements' do
                get disbursements_api_path, params: {}

                expect(response.status).to eq(200)  
            end
        end
    end
end
