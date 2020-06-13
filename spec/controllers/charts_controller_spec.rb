require 'rails_helper'
require 'webmock/rspec'

RSpec.describe ChartsController, type: :controller do
  let(:url) { "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{Rails.application.credentials[:api_key]}&page=1" }
  let(:url_without_token) { "https://api.pipelinedeals.com/api/v3/deals.json&page=1" }
  let(:json_mock) { File.read("spec/mocks/deals/deals.json") }

  describe 'GET #index' do
    context 'success' do
      it 'returns http success code' do
        WebMock.stub_request(:get, url).to_return(body: json_mock)
        get :index
        expect(response).to(have_http_status(:success))
      end

      it 'returns the chart data' do
        WebMock.stub_request(:get, url).to_return(body: json_mock)
        get :index
        expect(response).to(have_http_status(:success))
      end
    end
  end
end