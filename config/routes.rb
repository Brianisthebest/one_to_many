Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dungeons', to: 'dungeons#index'
  get '/dungeons/:id', to: 'dungeons#show'
  get '/monster_table_name', to: 'monsters#index'
end
