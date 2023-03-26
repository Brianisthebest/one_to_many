require 'rails_helper'

RSpec.describe '/new' do
 describe '#new_form' do
  it 'will have the form to create a dungeon' do
    visit '/dungeons/new'

    expect(page).to have_field("Name")
    expect(page).to have_content("Final level")
    expect(page).to have_unchecked_field("True")
    expect(page).to have_unchecked_field("False")
    expect(page).to have_field("Difficulty")
  end

  it 'can create a dungeon' do
    visit '/dungeons/new'

    fill_in("Name", with: "Castle Morne")
    choose("False")
    fill_in("Difficulty", with: "5")
    click_on("Create Dungeon")

    expect(current_path).to eq("/dungeons")
    expect(page).to have_content("Castle Morne")
  end
 end
end