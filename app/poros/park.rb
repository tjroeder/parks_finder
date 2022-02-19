class Park
  attr_reader :full_name,
              :description,
              :directions_info,
              :std_hours
  
  def initialize(data)
    @full_name = data[:fullName]
    @description = data[:description]
    @directions_info = data[:directionsInfo]
    @std_hours = data[:operatingHours][0][:standardHours]
  end
end
