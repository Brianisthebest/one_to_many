require 'rails_helper'

RSpec.describe '/dungeons/:id' do
  before(:each) do
    Dungeon.delete_all
    @dungeon_1 = Dungeon.create!(name: "Big Bad Things", final_level: true,  difficulty: 5)
    @dungeon_2 = Dungeon.create!(name: "Gross Sewers?", final_level: false,  difficulty: 2)
  end
  # User Story 2
  describe 'as a visitor, when I visit the dungeons show page' do

    it 'will show all the dungeon attributes' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_content(@dungeon_1.name)
      expect(page).to have_content("ID: #{@dungeon_1.id}")
      expect(page).to have_content("Final Level: #{@dungeon_1.final_level}.")
      expect(page).to have_content("Difficulty: #{@dungeon_1.difficulty}.")

      visit "/dungeons/#{@dungeon_2.id}"

      expect(page).to have_content(@dungeon_2.name)
      expect(page).to have_content("ID: #{@dungeon_2.id}")
      expect(page).to have_content("Final Level: #{@dungeon_2.final_level}.")
      expect(page).to have_content("Difficulty: #{@dungeon_2.difficulty}.")
    end

    # User Story 7
    it 'well show the count for monsters in dungeon' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_content("Monster Count: #{@dungeon_1.monster_count}.")

      visit "/dungeons/#{@dungeon_2.id}"

      expect(page).to have_content("Monster Count: #{@dungeon_2.monster_count}.")
    end

    it 'will display a link to dungeon and monster index' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")

      visit "/dungeons/#{@dungeon_2.id}"
      
      expect(page).to have_link("Dungeons", href: "/dungeons")
      expect(page).to have_link("Monsters", href: "/monsters")

      click_link "Dungeons"
      expect(current_path).to eq("/dungeons")

      click_link "Monsters"
      expect(current_path).to eq("/monsters")
    end
    # User Story 10
    it 'it will display a link to the parents child page' do
      visit "/dungeons/#{@dungeon_1.id}"
      expect(page).to have_link("Monster List", href: "/dungeons/#{@dungeon_1.id}/monsters")

      visit "/dungeons/#{@dungeon_2.id}"
      expect(page).to have_link("Monster List", href: "/dungeons/#{@dungeon_2.id}/monsters")
    end

    it 'will display a link to edit the dungeon' do
      visit "/dungeons/#{@dungeon_1.id}"
      save_and_open_page
      expect(page).to have_link("Edit Dungeon")
      click_link("Edit Dungeon")
      expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/edit")
    end
    # User Story 13
    it 'will display a link to create a new monster for the dungeon and direct to the /dungeon/:id/monster/new path' do
      visit "/dungeons/#{@dungeon_1.id}"

      expect(page).to have_link("Create Monster", href: "/dungeons/#{@dungeon_1.id}/monsters/new")
      click_on("Create Monster")

      expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters/new")
    end
  end
end