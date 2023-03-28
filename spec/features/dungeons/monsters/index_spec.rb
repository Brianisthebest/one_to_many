require 'rails_helper'

RSpec.describe '/dungeons/:id/monsters' do
  before(:each) do
    Dungeon.delete_all
    Monster.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
    @monster_1 = @dungeon_1.monsters.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
    @monster_2 = @dungeon_2.monsters.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_2.id)
    @monster_3 = @dungeon_2.monsters.create!(name: "Bad Skeleton", boss: false, health: 25, dungeon_id: @dungeon_2.id)  
  end
  # User Story 5
  describe 'as a visitor, when I visit the dungeon monsters index page' do
    it 'will show me each monster and attributes associated with that dungeon' do
      visit "/dungeons/#{@dungeon_1.id}/monsters"

      expect(page).to have_content(@dungeon_1.name)
      expect(page).to have_content("Dungeon ID: #{@dungeon_1.id}")
      expect(page).to have_content(@monster_1.name)
      expect(page).to have_content("Boss: #{@monster_1.boss}")
      expect(page).to have_content("Health: #{@monster_1.health}")
      
      visit "/dungeons/#{@dungeon_2.id}/monsters"

      expect(page).to have_content("Dungeon ID: #{@dungeon_2.id}")
      expect(page).to have_content(@monster_2.name)
      expect(page).to have_content("Boss: #{@monster_2.boss}")
      expect(page).to have_content("Health: #{@monster_2.health}")
      expect(page).to have_content(@monster_3.name)
      expect(page).to have_content("Boss: #{@monster_3.boss}")
      expect(page).to have_content("Health: #{@monster_3.health}")
    end

    it 'will display a link to dungeon and monster index' do
      visit "/dungeons/#{@dungeon_1.id}/monsters"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")

      visit "/dungeons/#{@dungeon_2.id}/monsters"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")
    end

    it 'will display a link to update the monster' do
      visit "/dungeons/#{@dungeon_1.id}/monsters"

      expect(page).to have_link("Update #{@monster_1.name}", href: "/monsters/#{@monster_1.id}/edit")
    end

    it 'will display a link to sort monsters alphabetically' do
      visit "/dungeons/#{@dungeon_2.id}/monsters?sort=abc"

      expect(page).to have_link("Sort Alphabetically")
      click_link("Sort Alphabetically")
      expect(@monster_3.name).to appear_before(@monster_2.name)
    end

    it 'will display a link to delete the monster' do
      visit "/dungeons/#{@dungeon_2.id}/monsters"

      expect(page).to have_link("Delete #{@monster_2.name}")
      expect(page).to have_link("Delete #{@monster_3.name}")
    end

    it 'will delete the monster when the link is clicked and redirect to the monster index' do
      visit "/dungeons/#{@dungeon_2.id}/monsters"

      click_link("Delete Medusa")
      expect(current_path).to eq("/monsters")
      expect(page).to_not have_content("Medusa")
    end
    # User Story 21, Display Records Over a Given Threshold 
    it 'will have a form that allows me to input a number value' do
      visit "/dungeons/#{@dungeon_1.id}/monsters"

      expect(page).to have_button("Only return monsters with Health more than")
      expect(page).to have_field("Length")
    end

    it 'will display only the monsters with health greater than the input value' do
      @dungeon_1.monsters.create!(name: "Goblin Less", boss: false, health: 5, dungeon_id: @dungeon_1.id)
      @dungeon_1.monsters.create!(name: "Goblin Greater", boss: false, health: 25, dungeon_id: @dungeon_1.id)

      visit "/dungeons/#{@dungeon_1.id}/monsters"
      
      fill_in("Length", with: 10)
      click_button("Only return monsters with Health more than")

      expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters")
      expect(page).to have_content("Goblin")
      expect(page).to have_content("Goblin Greater")
      expect(page).to have_no_content("Goblin Less")
    end
# Then I am brought back to the current index page with only the records that meet that threshold shown.
  end
end