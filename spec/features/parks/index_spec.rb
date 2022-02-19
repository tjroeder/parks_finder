require 'rails_helper'

RSpec.describe 'Parks index page', type: :feature do
  context 'as a user searching for parks by state' do
    describe 'viewable elements', :vcr do
      it 'displays no parks before searching by state' do
        visit parks_path

        expect(page).to have_current_path(parks_path)
        expect(page).to have_no_content('National Parks in ')
        expect(page).to have_no_content('Park Name: ')
        expect(page).to have_no_content('Description: ')
        expect(page).to have_no_content('Directions Info: ')
        expect(page).to have_no_content('Standard Hours of Operation:')
      end

      it 'displays all parks for the selected state' do
        visit root_path
        select 'Colorado', from: 'state'
        click_button 'Find Parks'

        expect(page).to have_content('National Parks in CO')
        expect(page).to have_content('Park Name: ')
        expect(page).to have_content('Description: ')
        expect(page).to have_content('Directions Info: ')
        expect(page).to have_content('Standard Hours of Operation:')
        expect(page).to have_content('Monday: ')
        expect(page).to have_content('Tuesday: ')
        expect(page).to have_content('Wednesday: ')
        expect(page).to have_content('Thursday: ')
        expect(page).to have_content('Friday: ')
        expect(page).to have_content('Saturday: ')
        expect(page).to have_content('Sunday: ')

        expect(page).to have_css('h2', count: 16 )
      end
    end
  end
end