class CreateDungeons < ActiveRecord::Migration[5.2]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.boolean :final_level
      t.integer :difficulty

      t.timestamps
    end
  end
end
