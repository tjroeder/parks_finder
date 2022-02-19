# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParkService, type: :service do
  context 'class methods', :vcr do
    describe '::conn' do
      it 'returns Faraday connection' do
        park = ParkService.conn

        expect(park).to be_a(Faraday::Connection)
      end
    end

    describe '::search_parks' do
      it 'returns hash of parks searched by state' do
        search = ParkService.search_parks('co')

        expect(search[:data].first[:states].downcase).to include('co')
        expect(search).to be_a(Hash)
        expect(search[:data]).to be_a(Array)
      end

      it 'returns array of 16 parks' do
        search = ParkService.search_parks('co')

        expect(search[:data].count).to eq(16)
      end
    end
  end
end