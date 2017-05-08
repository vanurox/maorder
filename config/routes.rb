Rails.application.routes.draw do
  get 'shoes/shoe'

  get 'public/view'

  get 'feature/feature'

  get 'camera/camera'

  get 'cosmetics/cosmetics'

  get 'furniture/furniture'

  get 'hair/hair'

  get 'homefurnishing/homefurnishing'

  get 'kidsclothing/kidsclothing'

  get 'kitchenappliance/kitchenappliance'

  get 'laptop/laptop'

  get 'login/login'

  get 'menclothing/menclothing'

  get 'mobile/mobile'

  get 'shoes/shoes'

  get 'tablet/tablet'

  get 'womenbags/womenbag'

  get 'womenclothing/womenclothing'

  get 'photo/photo'

  get 'product/product'

  get 'subcategory/subcategory'

  get 'category/category'

  get 'maincategory/maincategory'

  get 'admin/admin'

  get 'userdetail/userdetail'

  get 'user/user'


   get 'auth/:provider/callback', to: "sessions#create"
  
   delete "sessions/destroy"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'public#view'

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

   get':controller(/:action(/:id(.:format)))'=>'foo#matchers'
  post':controller(/:action(/:id(.:format)))'=>'foo#matchers'
end
