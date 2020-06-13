class ChartsController < ApplicationController
  def index
    render component: 'DealsChart', props: {
      data: DealsService::ColumnChartData.call(
        DealsService::Fetch.call.value
      ).value
    }
  end
end