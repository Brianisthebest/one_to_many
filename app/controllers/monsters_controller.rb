class MonstersController < ApplicationController
  def index
    @monsters = Monster.only_true
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    monster = Monster.find(params[:id])
    monster.update(monster_params)
    redirect_to "/monsters/#{monster.id}"
  end

  def destroy
    monster = Monster.find(params[:id])
    monster.destroy
    redirect_to "/monsters"
  end

private
  def monster_params
    params.permit(:name, :boss, :health)
  end
end