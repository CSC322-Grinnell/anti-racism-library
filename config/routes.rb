Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'user/sessions'
    #registrations: 'user/registrations'
  }
  
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # get pages for semi-static non-resource/user pages
  get '/contact_us/submit', to: 'non_library_pages#contact_us_submit'
  get '/contact_us', to: 'non_library_pages#contact_us'
  get '/suggest_a_resource', to: 'non_library_pages#suggest_resource'
  get '/about_us', to: 'non_library_pages#about_us'
  get '/user_console', to: 'admin#user_console'


  # get items pages
  get 'items/new'
  
  get 'items/not_admin', to: 'items#not_admin'
  
  get 'items/not_user', to: 'items#not_user'
  
  # get reports pages
  get 'reports/new' => 'reports#new', :as => 'report_new'

  # search for items
  get 'items/search' => 'items#index', :as => 'search_page'

  # route to admin page and admin search page (similar to normal index page)
  get 'items/admin_page' => 'items#admin_index', :as => 'admin'
  get 'items/admin_search' => 'items#admin_index', :as => 'admin_search_page'

  # patches methods for item
  resources :items do
    patch :deny, on: :member
    patch :approve, on: :member
    patch :pending, on: :member
  end
  
  # support basic methos for report, such as index, show, edit, create, destroy, update
  resources :reports do
    patch :resolve, on: :member
    patch :deny_item_and_resolve, on: :member
  end

    # patches methods for user console
    resources :admin do
      patch :promote, on: :member
      patch :demote, on: :member
      patch :ban, on: :member
      patch :unban, on: :member
    end

  get 'items/:id/deny', to: 'items#deny'
  get 'items/:id/approve', to: 'items#approve'
  get 'items/:id/pending', to: 'items#pending'
  
  get 'admin/:id/promote', to: 'admin#promote'
  get 'admin/:id/demote', to: 'admin#demote'

  get 'admin/:id/ban', to: 'admin#ban'
  get 'admin/:id/unban', to: 'admin#unban'

  get 'admin/show_user/:id', :to => 'admin#show_user', :as => :user

  #get 'admin/:id/show_user', to: 'admin#show_user'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "non_library_pages#about_us"

end