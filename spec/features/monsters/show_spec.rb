require 'rails_helper'

RSpec.describe '/monsters/:id' do
  # User Story 4
  describe 'as a visitor, when I visit the monsters show page' do
    it 'will show all the monster with that id and attributes' do
      dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
      
      monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: dungeon_1.id)
      monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: dungeon_1.id)
      
      visit "/monsters/#{monster_1.id}"
      
      expect(page).to have_content("ID: #{monster_1.id}.")
      expect(page).to have_content("Boss: #{monster_1.boss}.")
      expect(page).to have_content("Health: #{monster_1.health}.")
      
      visit "/monsters/#{monster_2.id}"
      
      expect(page).to have_content("ID: #{monster_2.id}")
      expect(page).to have_content("Boss: #{monster_2.boss}.")
      expect(page).to have_content("Health: #{monster_2.health}.")
    end
  end
end