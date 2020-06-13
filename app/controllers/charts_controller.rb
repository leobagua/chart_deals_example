class ChartsController < ApplicationController
  def index
    result = DealsService::Fetch.call

    if result.success?
      render component: 'DealsChart', props: {
        data: DealsService::ColumnChartData.call(result.value).value
      }
    end
  end
end