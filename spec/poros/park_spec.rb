require 'rails_helper'

RSpec.describe Park, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      data = { 
        fullName: "Alagnak Wild River",
        description: "The headwaters of Alagnak Wild River lie within the rugged Aleutian Range of neighboring Katmai National Park and Preserve. Meandering west towards Bristol Bay and the Bering Sea, the Alagnak traverses the beautiful Alaska Peninsula, providing an unparalleled opportunity to experience the unique wilderness, wildlife, and cultural heritage of southwest Alaska.",
        directionsInfo: "Alagnak Wild River is located in a remote part of the Alaska Peninsula, about 290 miles southwest of Anchorage. Access is by boat or small floatplane.",
        operatingHours: [{
                          exceptions: [],
                          description: "Alagnak Wild River is never closed, but access can be difficult during the winter.",
                          standardHours: {
                                          wednesday: "All Day",
                                          monday: "All Day",
                                          thursday: "All Day",
                                          sunday: "All Day",
                                          tuesday: "All Day",
                                          friday: "All Day",
                                          saturday: "All Day"
                          },
                          name: "Alagnak Wild River"
                         }
                        ]
        }
      park = Park.new(data)
      
      expect(park).to be_a(Park)
      expect(park).to have_attributes(full_name: "Alagnak Wild River")
      expect(park).to have_attributes(description: "The headwaters of Alagnak Wild River lie within the rugged Aleutian Range of neighboring Katmai National Park and Preserve. Meandering west towards Bristol Bay and the Bering Sea, the Alagnak traverses the beautiful Alaska Peninsula, providing an unparalleled opportunity to experience the unique wilderness, wildlife, and cultural heritage of southwest Alaska.")
      expect(park).to have_attributes(directions_info: "Alagnak Wild River is located in a remote part of the Alaska Peninsula, about 290 miles southwest of Anchorage. Access is by boat or small floatplane.")
      expect(park).to have_attributes(std_hours: {
                                                  wednesday: "All Day",
                                                  monday: "All Day",
                                                  thursday: "All Day",
                                                  sunday: "All Day",
                                                  tuesday: "All Day",
                                                  friday: "All Day",
                                                  saturday: "All Day"
                                                 }
      )
    end
  end
end
