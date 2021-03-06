Rails.application.routes.draw do

  root 'posts#index'

  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'unlike'
    end
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'browse', to: 'posts#browse', as: :browse_posts
  
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'

  get 'profiles/show'
  
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

end
