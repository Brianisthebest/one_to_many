Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dungeons', to: 'dungeons#index'
  get '/dungeons/:id', to: 'dungeons#show'
  get '/dungeons/:dungeon_id/monsters', to: 'dungeons/monsters#index'
  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
end
