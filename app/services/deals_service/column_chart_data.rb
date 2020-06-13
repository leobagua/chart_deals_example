module DealsService
  class ColumnChartData < ApplicationService
    def initialize(data)
      @data = data
    end

    def call
      Result.new(true, nil, column_chart_data)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :data

    def column_chart_data
      grouped_entries = data['entries'].group_by { |deal| deal['deal_stage']['percent'] }.sort
      grouped_entries.map do |percentage, entries|
        deal_stage_name = entries.first['deal_stage']['name']
        {
          label: "#{deal_stage_name}(#{percentage}%)",
          amount: entries.sum { |entry| entry['value'].to_f }
        }
      end
    end
  end
end