Xeroimporter::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }

  devise_scope :user do
    match "/logout" => "devise/sessions#destroy"
  end
  match "/customer/index" => "customers#index"
  match "/payment/index" => "payments#index"
  match "/invoice/index" => "invoices#index"
  match "/supplier/index" => "suppliers#index"
  match "/xeroapi/new" => "xeroapi#new"
  match "/xeroapi/create" => "xeroapi#create"
  match "/xeroapi/destroy" => "xeroapi#destroy"
  match "/xeroapi/synchronize" => "xeroapi#synchronize"
  post "/xeroapi/getcode" => "xeroapi#get_xero"
  get "xeroapi/getcode" => "xeroapi#get_code"
  match "/xeroapi/index" => "xeroapi#index"
  #match "/registrations/comfirm_mail" => "registrations#comfirm_mail"
  #devise_scope :users do
  #  match "/login" => "devise/sessions#new" # Add a custom sign in route for user sign in
  #  match "/logout" => "devise/sessions#destroy" # Add a custom sing out route for user sign out
  #  match "/login/forgot-password" => "devise/passwords#new" # Add a Custom Route for Forgot password
  #  match "/login/restore-password" => "devise/passwords#create" # Add a Custom Route for Forgot password
  #end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => "home#index"

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
