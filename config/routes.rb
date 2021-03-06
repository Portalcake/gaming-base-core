Gamingbase::Application.routes.draw do

  mount Forum::Engine => "/"
  mount Rose::Engine => "/"
  mount Ragnarok2::Engine => "/"

  scope ":locale" do
    # users should not delete themselves (maybe we change this later)
    # so we skip the default registration routes
    # and recreate them again without :delete
    devise_for :users, skip: :registrations, 
      :path_names => {
        :sign_in => 'login',
        :sign_out => 'logout'
      }
    devise_scope :user do
      resource :registration,
        only: [:new, :create, :edit, :update],
        path: 'users',
        path_names: { new: 'register' },
        controller: 'devise/registrations',
        as: :user_registration do
          get :cancel
        end
    end

    resources :news do
      collection do
        get :games
        get :gaming_base
      end
    end

    get "missing_information" => "dashboard#missing_information", :as => :missing_information

    namespace :forum do
      resources :threads do
        resources :posts
      end
    end

    namespace :admin, :as=>false do
      resources :news_feeds, :except => [:show, :new]
    end
  end
  
  match ":locale" => "dashboard#start", :as => :dashboard
  root :to => "dashboard#localize"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
