Onkeeband::Application.routes.draw do
  
  resources :events, :path => "shows", :path_names => { :new => 'schedule', :edit => 'modify' }

  devise_for :users
  
  devise_scope :user do 
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end
  
  resources :users, :only => [:index, :show]

  post '/subscribe' => 'subscription#subscribe'
  get '/unsubscribe/:scptn_hash' => 'subscription#unsubscribe'
  get '/subscriptions' => 'subscription#index'

  # Static Pages
  scope :controller => :pages do 
    get '/history'   => 'pages#history'
    get '/profiles'      => 'pages#profiles'
    get '/photos'      => 'pages#photos'
    get '/support'      => 'pages#support'
    get '/contact'      => 'pages#contact'
    
    # Individual Bios Pages
    scope '/management' do
      get 'lenny'.parameterize  => 'pages#lenny'
      get 'anita'.parameterize  => 'pages#anita'
      get 'david'.parameterize  => 'pages#romaine'
    end
    
    scope '/washington-dc' do
      get 'aubrey'   => 'pages#aubrey'
      get 'david'    => 'pages#david'
      get 'lenny'    => 'pages#lenny'
      get 'cornell'    => 'pages#cornell'
      get 'rhube'    => 'pages#rhube'
    end
    
    scope '/boston' do
      get 'carl'     => 'pages#carl'
      get 'darren'   => 'pages#darren'
      get 'greg'     => 'pages#greg'
      get 'lenny'    => 'pages#lenny'
      get 'rasheed'  => 'pages#rasheed'
    end
    
    scope '/featured-guest' do
      get 'michael'     => 'pages#michael'
    end
    
    # scope '/guests' do
    #   get 'rodney'.parameterize  => 'pages#rodney'
    # end
    
  end
  
  
  # Homepage
  root  :to => "pages#home", :via => :get
  

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
