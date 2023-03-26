require 'rails_helper'

RSpec.describe '/dungeons/:id/monsters/new' do
  before(:each) do
    Dungeon.delete_all
    Monster.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
    @monster_1 = @dungeon_1.monsters.create!(name: "Goblin", boss: false, health: 15, dungeon_id: @dungeon_1.id)
    @monster_2 = @dungeon_2.monsters.create!(name: "Medusa", boss: true, health: 75, dungeon_id: @dungeon_2.id)
    @monster_3 = @dungeon_2.monsters.create!(name: "Skeleton", boss: false, health: 25, dungeon_id: @dungeon_2.id)
  end

  describe 'as a visitor, when I visit /dungeons/:id/monsters/new' do
    it 'will display a form to create a new monster and redirect to /monsters with new monster displayed' do
      visit "/dungeons/#{@dungeon_1.id}/monsters/new"
  
      expect(page).to have_field("Name")
      expect(page).to have_content("Boss")
      expect(page).to have_unchecked_field("True")
      expect(page).to have_unchecked_field("False")
      expect(page).to have_field("Health")
    end
    
    it 'can create a dungeon' do
      visit "/dungeons/#{@dungeon_1.id}/monsters/new"
  
      fill_in("Name", with: "Skeleton King")
      choose("False")
      fill_in("Health", with: "35")
      click_on("Create Monster")
  
      expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters")
      expect(page).to have_content("Skeleton King")
      expect(page).to have_content("Boss: false")
      expect(page).to have_content("Health: 35")
    end
  end
end
  # When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
