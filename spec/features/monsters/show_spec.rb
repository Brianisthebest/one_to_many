require 'rails_helper'

RSpec.describe '/monsters/:id' do
  before(:each) do
    Dungeon.delete_all
    Monster.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
    @monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_1.id)
  end
  # User Story 4
  describe 'as a visitor, when I visit the monsters show page' do
    it 'will show all the monster with that id and attributes' do
      visit "/monsters/#{@monster_1.id}"
      
      expect(page).to have_content("ID: #{@monster_1.id}.")
      expect(page).to have_content("Boss: #{@monster_1.boss}.")
      expect(page).to have_content("Health: #{@monster_1.health}.")
      
      visit "/monsters/#{@monster_2.id}"
      
      expect(page).to have_content("ID: #{@monster_2.id}")
      expect(page).to have_content("Boss: #{@monster_2.boss}.")
      expect(page).to have_content("Health: #{@monster_2.health}.")
    end

    it 'will display a link to dungeon and monster index' do
      visit "/monsters/#{@monster_1.id}"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")

      visit "/monsters/#{@monster_2.id}"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")
    end
    # User Story 14
    it 'will display a link to update the monster which takes the user to /monsters/:id/edit' do
      visit "/monsters/#{@monster_1.id}"

      expect(page).to have_link("Update Monster", href: "/monsters/#{@monster_1.id}/edit")
    end
    # User Story 20
    it 'will display a link to delete the monster' do
      visit "/monsters/#{@monster_1.id}"

      expect(page).to have_link("Delete Monster")
      expect(current_path).to eq("/monsters/#{@monster_1.id}")
    end

    it 'will delete the monster when the link is clicked and redirect to the monster index' do
      visit "/monsters/#{@monster_1.id}"
      click_link "Delete Monster"

      expect(current_path).to eq("/monsters")
      expect(page).to_not have_content("Goblin")
    end
  end
end