Myapp::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  
  get "home/index"
  get "home/minor"
  
  get 'info/index'

  get 'howto/index'

  get 'league/dashboard'
  get 'league/:id/info', to: 'league#info'
  get 'league/:id/lineup', to: 'league#lineup'
  get 'league/:id/trade', to: 'league#trade'
  get 'league/:id/draft', to: 'league#draft'
  get 'league/:id/autopick', to: 'league#autopick'
  get 'league/:id/result', to: 'league#result'
  get 'league/:id/interleague', to: 'league#interleague'
  post '/league/create', to: 'league#create_new_league'
  post '/league/join', to: 'league#join_league'
  
  get 'league/leave_league/:id', to: 'league#leave_league'
  
  
  post '/data/getPlayers', to: 'data#get_all_players'
  post '/data/getDraftTeams', to: 'data#get_draft_teams'
  post '/data/getResults', to: 'data#get_result'
  post '/proc/draftRandomPick', to: 'proc#draft_random_pick'
  post '/proc/draftPick', to: 'proc#draft_pick'
  post '/proc/draftEnd', to: 'proc#draft_end'

  get 'admin/manage'
  get 'admin/make_user'
  get 'admin/delete_user/:id', to: 'admin#delete_user'
  get 'admin/create_room'
  get 'admin/delete_room_with_admin'
  get 'admin/delete_room/:id', to: 'admin#delete_room'
  get 'admin/join_room_from_user'
  get 'admin/join_room'
  get 'admin/delete_team/:id', to: 'admin#delete_team'
  get 'admin/create_player_from_admin'
  get 'admin/create_player'
  get 'admin/create_player_random'
  get 'admin/delete_player/:id', to: 'admin#delete_player'
  get 'admin/pick_player_from_admin'
  get 'admin/pick_player'
  get 'admin/unpick_player/:id', to: 'admin#unpick_player'
  get 'admin/get_data_random'
  get 'admin/get_data'
  get 'admin/get_data_random_from_admin'
  get 'admin/get_data_random_all_player'
  get 'admin/delete_data_pitch/:id', to: 'admin#delete_data_pitch'
  get 'admin/delete_data_bat/:id', to: 'admin#delete_data_bat'
  get 'admin/make_game'
  get 'admin/make_game_from_admin'
  get 'admin/delete_game/:id', to: 'admin#delete_game'
  get 'admin/play_game/:id', to: 'admin#play_game'
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
