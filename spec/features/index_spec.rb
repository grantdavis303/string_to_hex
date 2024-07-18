require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'displays input field and button' do
    visit root_path

    expect(page).to have_link('String to Hexadecimal', href: root_path)

    expect(page).to have_content('What is this app?')
    expect(page).to have_content('This is an application that converts a string of any length to a hexadecimal code.')
    
    expect(page).to have_content('Valid Inputs')

    expect(page).to have_content('Empty string - ""')
    expect(page).to have_content('Single character - "a"')
    expect(page).to have_content('Single word - "hello"')
    expect(page).to have_content('Sentence - "The dog jumped over the fence."')
    expect(page).to have_content('Paragraph - "Two dogs are happily playing together in the park. They chase each other around, wagging their tails in excitement. The dogs take turns playfully nipping at each other and rolling around on the grass. Their joyful barks fill the air as they run around in circles. It is heartwarming to see the bond between these two furry friends."')
    expect(page).to have_link('An entire novel?', href: 'https://www.baen.com/Chapters/1597801348/1597801348___3.htm')

    expect(page).to have_content("Input")
    expect(page).to have_field(:string)
    expect(page).to have_button("Convert to Hexadecimal")
  end

  it 'successfully converts an empty string to a hex code' do
    visit root_path

    fill_in :string, with: ""
    click_on "Convert to Hexadecimal"

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results")
    expect(page).to have_content("Converted Hexadecimal: #f0e0d0")
  end

  it 'successfully converts a single character to a hex code' do
    visit root_path

    fill_in :string, with: "a"
    click_on "Convert to Hexadecimal"

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results")
    expect(page).to have_content("Converted Hexadecimal: #a1f0e0")
  end

  it 'successfully converts a single word to a hex code' do
    visit root_path

    fill_in :string, with: "Turing"
    click_on "Convert to Hexadecimal"

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results")
    expect(page).to have_content("Converted Hexadecimal: #f0e0d0")
  end

  it 'successfully converts a sentence to a hex code' do
    visit root_path

    fill_in :string, with: "The dog jumped over the fence."
    click_on "Convert to Hexadecimal"

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results")
    expect(page).to have_content("Converted Hexadecimal: #e6d2f1")
  end

  it 'successfully converts a paragraph to a hex code' do
    visit root_path

    fill_in :string, with: "Two dogs are happily playing together in the park. They chase each other around, wagging their tails in excitement. The dogs take turns playfully nipping at each other and rolling around on the grass. Their joyful barks fill the air as they run around in circles. It is heartwarming to see the bond between these two furry friends as they enjoy each other's company."
    click_on "Convert to Hexadecimal"

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results")
    expect(page).to have_content("Converted Hexadecimal: #e8a7d8")
  end
end