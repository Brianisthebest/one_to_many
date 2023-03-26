require 'rails_helper'

RSpec.describe '/monsters/:id/edit' do
  before(:each) do
    Monster.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
  end
  describe '#edit_form' do
    it 'will display a form to update the monster information and redirect to the monster show page' do
      visit "/monsters/#{@monster_1.id}/edit"

      expect(page).to have_field("Name")
      expect(page).to have_content("Boss")
      expect(page).to have_unchecked_field("True")
      expect(page).to have_unchecked_field("False")
      expect(page).to have_field("Health")
    end
    it 'will edit the dungeon after the form is filled and submitted' do
      visit "/monsters/#{@monster_1.id}/edit"

      fill_in("Name", with: "Skeleton")
      choose("True")
      fill_in("Health", with: "20")
      click_on("Update Monster")

      expect(current_path).to eq("/monsters/#{@monster_1.id}")
      expect(page).to have_content("Skeleton")
      expect(page).to have_no_content("Goblin")
      expect(page).to have_content("Boss: true")
      expect(page).to have_no_content("Boss: false")
      expect(page).to have_content("Health: 20")
      expect(page).to have_no_content("Health: 15")
    end
  end
end