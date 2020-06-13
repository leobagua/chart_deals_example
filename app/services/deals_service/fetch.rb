module DealsService
  class Fetch < ApplicationService
    ENDPOINT = 'https://api.pipelinedeals.com/api/v3/deals.json'

    def initialize(page = 1, timeout = 5.seconds)
      @page = page
      @timeout = timeout
    end

    def call
      Result.new(true, nil, fetch)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :page, :timeout

    def fetch
      response = RestClient::Request.execute(
        method: :get, url: ENDPOINT, timeout: timeout,
        headers: {
          params: {
            api_key: Rails.application.credentials[:api_key],
            page: page
          }
        }
      )

      JSON.parse response
    end
  end
end