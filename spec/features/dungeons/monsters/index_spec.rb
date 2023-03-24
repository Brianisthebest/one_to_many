RSpec.describe '/dungeons/:id/monsters' do
  before(:each) do
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
    @monster_1 = Monster.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
    @monster_2 = Monster.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_2.id)
    @monster_3 = Monster.create!(name: "Skeleton", boss: false, health: 25, dungeon_id: @dungeon_2.id)
  end
  # User Story 5
  describe 'as a visitor, when I visit the dungeon monsters index page' do
    it 'will show me each monster and attributes associated with that dungeon' do
      visit "/dungeons/#{@dungeon_1.id}/monsters"

      expect(page).to have_content("Dungeon #{@dungeon_1.id}")
      expect(page).to have_content(@monster_1.name)
      expect(page).to have_content("Boss: #{@monster_1.boss}")
      expect(page).to have_content("Health: #{@monster_1.health}")
      
      visit "/dungeons/#{@dungeon_2.id}/monsters"

      expect(page).to have_content("Dungeon #{@dungeon_2.id}")
      expect(page).to have_content(@monster_2.name)
      expect(page).to have_content("Boss: #{@monster_2.boss}")
      expect(page).to have_content("Health: #{@monster_2.health}")
      expect(page).to have_content(@monster_3.name)
      expect(page).to have_content("Boss: #{@monster_3.boss}")
      expect(page).to have_content("Health: #{@monster_3.health}")
    end

    it 'will display a link to dungeon and monster index' do
      visit "/dungeons"
      # require 'pry'; binding.pry

      expect(page).to have_link("Dungeons")
      expect(page).to have_link("Monsters")
    end
  end
end