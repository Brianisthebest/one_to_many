class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.boolean :boss
      t.integer :health
      t.references :dungeon, foreign_key: true

      t.timestamps
    end
  end
end
