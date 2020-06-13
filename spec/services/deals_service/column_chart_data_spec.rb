require 'rails_helper'
require 'webmock/rspec'

RSpec.describe DealsService::ColumnChartData, type: :service do
  it 'must order the data by percentage' do
    data = {
      entries: [
        {
          deal_stage: {
            name: 'Third',
            percent: 50
          },
        },
        {
          deal_stage: {
            name: 'First',
            percent: 0
          },
        },
        {
          deal_stage: {
            name: 'Second',
            percent: 25
          },
        },
      ]
    }.with_indifferent_access

    expect(DealsService::ColumnChartData.call(data).value.first[:label]).to eq("First(0%)")
    expect(DealsService::ColumnChartData.call(data).value.second[:label]).to eq("Second(25%)")
    expect(DealsService::ColumnChartData.call(data).value.third[:label]).to eq("Third(50%)")
  end

  it 'must sum correctly' do
    data = {
      entries: [
        {
          value: '50.50',
          deal_stage: {
            name: 'Third',
            percent: 50
          },
        },
        {
          value: '50.50',
          deal_stage: {
            name: 'First',
            percent: 0
          },
        },
        {
          value: '100',
          deal_stage: {
            name: 'Second',
            percent: 25
          },
        },
      ]
    }.with_indifferent_access

    expect(DealsService::ColumnChartData.call(data).value.map {|entries| entries[:amount]}.sum).to eq(201.0)
  end
end