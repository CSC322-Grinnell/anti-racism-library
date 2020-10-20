Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'user/sessions'
    #registrations: 'user/registrations'
  }
  
  # get pages for semi-static non-resource/user pages
  get '/contact_us', to: 'non_library_pages#contact_us'
  get '/suggest_a_resource', to: 'non_library_pages#suggest_resource'
  get '/about_us', to: 'non_library_pages#about_us'
  
  # get items pages
  get 'items/new'
  
  
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root :to => "non_library_pages#about_us"
  
end
