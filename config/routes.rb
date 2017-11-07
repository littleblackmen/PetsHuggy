#4
Rails.application.routes.draw do
  #26
  resources :listings

  #9
  root :to => "pages#index"
  #19 #22
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",:registrations => 'registrations' }
  #21
  resources :users, only: [:show]
  #39 #41
  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end
  #30
  get 'manage-listing/:id/basics' => 'listings#basics', as: 'manage_listing_basics'
  #32
  get 'manage-listing/:id/description' => 'listings#description', as: 'manage_listing_description'
  #33
  get 'manage-listing/:id/address' => 'listings#address', as: 'manage_listing_address'
  get 'manage-listing/:id/price' => 'listings#price', as: 'manage_listing_price'
  get 'manage-listing/:id/photos' => 'listings#photos', as: 'manage_listing_photos'
  get 'manage-listing/:id/calender' => 'listings#calender', as: 'manage_listing_calender'
  get 'manage-listing/:id/bankaccount' => 'listings#bankaccount', as: 'manage_listing_bankaccount'
  get 'manage-listing/:id/publish' => 'listings#publish', as: 'manage_listing_publish'


end
