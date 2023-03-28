class Dungeon < ApplicationRecord
  has_many :monsters

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def monster_count
    monsters.count
  end

  def sort_alphabetically
    monsters.order(:name)
  end

  def sort_by(params)
    if params[:sort] == 'abc'
      sort_alphabetically
    elsif params[:sort] == 'amnt'
      select_with_length(params)
    else
      monsters.order(created_at: :desc)
    end
  end

  def select_with_length(params)
    monsters.where("health >= ?", params[:length])
  end
end