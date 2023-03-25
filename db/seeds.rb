# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
      Dungeon.destroy_all
      Monster.destroy_all
      @dungeon_1 = Dungeon.create!(name: "Decayed Catacombs", final_level: true,  difficulty: 5, created_at: 2.days.ago)
      @dungeon_2 = Dungeon.create!(name: "Your Basement", final_level: false,  difficulty: 2, created_at: 3.days.ago)
      @dungeon_3 = Dungeon.create!(name: "Lake of Rot", final_level: false,  difficulty: 6, created_at: 1.day.ago)
      @dungeon_1.monsters.create!(name: "Skeleton", boss: false, health: 10)
      @dungeon_2.monsters.create!(name: "Demi Human", boss: false, health: 25)
      @dungeon_2.monsters.create!(name: "Melania", boss: true, health: 200)
      @dungeon_3.monsters.create!(name: "Alabaster Lord", boss: false, health: 35)
      @dungeon_3.monsters.create!(name: "Basilisk", boss: false, health: 20)
      @dungeon_3.monsters.create!(name: "Ulcerated Tree Spirit", boss: true, health: 150)
