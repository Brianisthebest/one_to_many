class Monster < ApplicationRecord
  belongs_to :dungeon

  def self.only_true
    Monster.where("boss=true")
  end
end