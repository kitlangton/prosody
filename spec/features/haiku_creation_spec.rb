require 'rails_helper'

feature 'User can create a haiku' do
  scenario 'it lists the syllables for the first line' do
    visit root_path
    five_syllables = "I was awoken"
    fill_in 'Haiku Body', with: five_syllables
    send_keys [:control, "a"]
    expect(page).to have_content '#first-line', text: "5"
  end
end
