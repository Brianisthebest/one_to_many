class Monster < ApplicationRecord
  belongs_to :dungeon

  def only_true
    require 'pry'; binding.pry
  end
end