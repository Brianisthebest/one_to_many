require 'rails_helper'

RSpec.describe '/monster', type: :feature do
  before(:each) do
    Dungeon.delete_all
    Monster.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
    @monster_1 = Monster.create!(name: "Goblin", boss: true, health: 15, dungeon_id: @dungeon_1.id)
    @monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_2.id)
    @monster_3 = Monster.create!(name: "BBEG", boss: true, health: 75, dungeon_id: @dungeon_2.id)
  end
  # User Story 3
  describe 'as a visitor, when I visit the monster index page' do
    it 'will show me all monsters and attributes' do      
      visit "/monsters"

      expect(page).to have_content("Monsters Index")
      expect(page).to have_content("Name: #{@monster_1.name}")
      expect(page).to have_content("Boss: #{@monster_1.boss}")
      expect(page).to have_content("Health: #{@monster_1.health}")
      expect(page).to have_content("Name: #{@monster_2.name}")
      expect(page).to have_content("Boss: #{@monster_2.boss}")
      expect(page).to have_content("Health: #{@monster_2.health}")
    end

    it 'will display a link to dungeon and monster index' do
      visit "/monsters"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")
    end

    it 'will display a link to update the monster' do
      visit "/monsters"

      expect(page).to have_link("Update Monster", href: "/monsters/#{@monster_1.id}/edit")
    end
    # User Story 15
    it 'will only display monsters with boss true' do
      visit "/monsters"

      expect(page).to have_content("Name: Medusa")
      expect(page).to have_content("Name: BBEG")
    end
    # User Story 23, Child Delete From Childs Index Page 
    it 'will display a link to delete the monster' do
      visit "/monsters"

      expect(page).to have_link("Delete Monster")
    end

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child
  end
end