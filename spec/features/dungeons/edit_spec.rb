require 'rails_helper'

RSpec.describe '/new' do
  before(:each) do
    Dungeon.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
  end

  describe '#edit_form' do
    it 'will display a form to update the dungeon information and redirect to the dungeon show page' do
      visit "/dungeons/#{@dungeon_1.id}/edit"

      expect(page).to have_field("Name")
      expect(page).to have_content("Final level")
      expect(page).to have_unchecked_field("True")
      expect(page).to have_unchecked_field("False")
      expect(page).to have_field("Difficulty")
    end
    it 'will edit the dungeon after the form is filled and submitted' do
      visit "/dungeons/#{@dungeon_1.id}/edit"

      fill_in("Name", with: "Rancid Tomb")
      choose("False")
      fill_in("Difficulty", with: "7")
      click_on("Edit Dungeon")

      expect(current_path).to eq("/dungeons/#{@dungeon_1.id}")
      expect(page).to have_content("Rancid Tomb")
      expect(page).to have_no_content("Big Bad Things")
      expect(page).to have_content("Final Level: false")
      expect(page).to have_no_content("Final Level: true")
      expect(page).to have_content("Difficulty: 7")
      expect(page).to have_no_content("Difficulty: 5")
    end
  end
end