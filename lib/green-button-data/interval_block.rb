module GreenButtonData
  class IntervalBlock < Entry
    include Utilities

    attr_accessor :length, :starts_at, :ends_at, :duration

    def initialize(attributes)
      super

      @starts_at = @interval.starts_at local: true
      @ends_at = @interval.ends_at local: true
      @duration = @interval.duration
      @length = @interval_readings.size
    end

    ##
    # Returns an array representation of all the interval data
    def to_a
      result = []

      @interval_readings.each do |interval_reading|
        result << {
          starts_at: interval_reading.time_period.starts_at(local: true),
          ends_at: interval_reading.time_period.ends_at(local: true),
          duration: interval_reading.time_period.duration,
          value: interval_reading.value
        }
      end

      return result
    end
  end
end
