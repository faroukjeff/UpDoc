Rails.application.routes.draw do
  
  get 'sessions/new'

  resources :hospitals
  resources :credentials
  
  get "homepage/home"
  get "sessions/show"
  get "profile/doctorprofile"
  get "profile/medicalrecords"
  get "profile/searchpatients"
  post "profile/searchpatients"
  get "profile/myappt"
  post "profile/myappt"
  get "signup/signup"
  post "signup/add"
  get "forgotpass/forgotpass"
  get "admin/admin"
  get "admin/linkdoc"
  get "admin/docsignup"
  get "admin/docappt"
  get "admin/reset"
  post "reset/reset"
  post "docsignup/add"
  post "linkdoc/link"
  post "docappt/add"
  post "appointment/confirm"
  get "appointment/appointment"
  get "appointment/appointment"
  root "homepage#home"
  

  resources :contacts,
            controller: "contact_us/contacts",
            only:       [:new, :create]
            
  get "contact_usd" => "contact_us/contact_mailer#contact_email"
  get "contact-us" => "contact_us/contacts#new", as: :contact_us1
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#show'
  delete '/logout',  to: 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
