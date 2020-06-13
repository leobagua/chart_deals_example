require 'rails_helper'
require 'webmock/rspec'

RSpec.describe DealsService::Fetch, type: :service do
  let(:url) { "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{Rails.application.credentials[:api_key]}&page=1" }
  let(:url_without_token) { "https://api.pipelinedeals.com/api/v3/deals.json&page=1" }
  let(:json_mock) { File.read("spec/mocks/deals/deals.json") }

  it 'must get a valid response from api' do
    WebMock.stub_request(:get, url).to_return(body: json_mock)
    expect(DealsService::Fetch.call.success?).to be(true)
    expect(DealsService::Fetch.call.value).to include(JSON.parse(json_mock))
  end

  it 'must get a valid response from api with empty data' do
    WebMock.stub_request(:get, url).to_return(body: '{}')
    expect(DealsService::Fetch.call.success?).to be(true)
    expect(DealsService::Fetch.call.value).to include({})
  end
end