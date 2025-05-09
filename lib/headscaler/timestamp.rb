module Headscaler
  module Utils
    TIME_FORMATS = {
        "s" => (1),
        "m" => (60),
        "h" => (60 * 60),
        "d" => (60 * 60 * 24)
    }
    # @return Google::Protobuf::Timestamp
    # @param duration String or Fixnum, if Fixnum it will be handeled as seconds
    def self.timestamp(duration)
      time = Time.now.to_i
      if duration.is_a? String
        duration.scan(/(\d+)(\w)/).each do |amount, measure|
          time += amount.to_i * TIME_FORMATS[measure]
        end
      else
        time += duration
      end

      Google::Protobuf::Timestamp.new seconds: time
    end
  end
end