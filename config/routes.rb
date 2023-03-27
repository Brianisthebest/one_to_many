Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'dungeons#index'
  get '/dungeons', to: 'dungeons#index'
  get '/dungeons/new', to: 'dungeons#new'
  post '/dungeons', to: 'dungeons#create'
  
  get '/dungeons/:id/edit', to: 'dungeons#edit'
  patch '/dungeons/:id', to: 'dungeons#update'
  get '/dungeons/:id', to: 'dungeons#show'
  delete 'dungeons/:id', to: 'dungeons#destroy'

  get '/dungeons/:dungeon_id/monsters', to: 'dungeons/monsters#index'
  get '/dungeons/:dungeon_id/monsters/new', to: 'dungeons/monsters#new'
  post '/dungeons/:dungeon_id/monsters/new', to: 'dungeons/monsters#create'

  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
  get '/monsters/:id/edit', to: 'monsters#edit'
  patch '/monsters/:id/edit', to: 'monsters#update'
  delete '/monsters/:id', to: 'monsters#destroy'
end
