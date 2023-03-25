require 'rails_helper'

RSpec.describe "/dungeons", type: :feature do
  before(:each) do
    Dungeon.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5, created_at: 1.day.ago)
    @dungeon_2 = Dungeon.create(name: "Gross Sewers?", final_level: false,  difficulty: 2, created_at: 2.days.ago)
  end
  # User Story 1
  describe "as a vistor, I visit dungeons index page" do
    it 'will display the name of each dungeon' do
      visit "/dungeons"

      expect(page).to have_content("Dungeons Index")
      expect(page).to have_content(@dungeon_1.name)
      expect(page).to have_content("Created at: #{@dungeon_1.created_at}")
      expect(page).to have_content(@dungeon_2.name)
      expect(page).to have_content("Created at: #{@dungeon_2.created_at}")
      expect(page).to_not have_content(@dungeon_1.final_level)
    end
    # User Story 6
    it 'sorts the dungeons by most recently created' do
      visit "/dungeons"

      expect(@dungeon_1.name).to appear_before(@dungeon_2.name)
    end

    it 'will display a link to dungeon and monster index' do
      visit "/dungeons"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")

      click_link "Dungeons"
      expect(current_path).to eq("/dungeons")

      click_link "Monsters"
      expect(current_path).to eq("/monsters")
    end
    # User Story 11, Parent Creation 
    it 'will display a link to create a new dungeon and route to the dungeons/new path' do
      visit "/dungeons"

      expect(page).to have_link("Create Dungeon", href: "/dungeons/new")

      click_link "Create Dungeon"
      expect(current_path).to eq("/dungeons/new")
    end
    # User Story 12, Parent Update 
    it 'will display a link to update a new dungeon and route to the dungeons/:id/edit path' do
      Dungeon.delete_all
      dungeon = Dungeon.create(name: "Edit Test", final_level: false,  difficulty: 4)
      
      visit "/dungeons"

      expect(page).to have_link("Edit Dungeon", href: "/dungeons/#{dungeon.id}/edit")

      click_link "Edit Dungeon"
      expect(current_path).to eq("/dungeons/#{dungeon}/edit")
    end
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"

# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
  end
end
