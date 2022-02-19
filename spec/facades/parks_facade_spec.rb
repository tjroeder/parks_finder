require 'rails_helper'

RSpec.describe ParkFacade, type: :facade do
  context 'class methods' do
    describe '::state_parks', :vcr do
      it 'should return an array of queried park objects' do
        park_list = ParkFacade.state_parks('co')

        expect(park_list).to be_a(Array)
        expect(park_list.first).to be_a(Park)
      end

      it 'should return 16 parks' do
        park_list = ParkFacade.state_parks('co')

        expect(park_list.count).to eq(16)
      end
    end
  end
end