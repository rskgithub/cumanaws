Rails.application.routes.draw do
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
  
  devise_for :cuentas, :skip => [:sessions,:registrations,:passwords]
  as :cuenta do
    
    get 'iniciarsesion', to: 'sessions#new', as: :iniciarsesion
    post 'iniciarsesion', to: 'sessions#create'
    get 'iniciarsesion/:redir', to: 'sessions#new', as: :iniciarsesion_redir
    post 'iniciarsesion/:redir', to: 'sessions#create'
    
    
    get 'cerrarsesion', to: 'devise/sessions#destroy', as: :cerrarsesion
    
    get 'crearcuenta', to: "registrations#new"
    post 'crearcuenta', to: "registrations#create"
    
    get 'cancelarcuenta', to: "devise/registrations#cancel", as: :cancel_cuenta_registration
    
    get 'editarcuenta', to: "registrations#edit", as: :edit_cuenta_registration
    patch 'editarcuenta', to: "registrations#update" #, as: :edit_cuenta_registration
    put 'editarcuenta', to: "registrations#update" # , as: :edit_cuenta_registration
    
    delete 'eliminarcuenta', to: "devise/registrations#destroy" #, as: :edit_cuenta_registration
    
    get 'validarpersonaef/:ef' , to: 'registrations#validar_persona_ef'
    
    get 'validarorganizacion/:representa' , to: 'registrations#validar_organizacion'
    
    get 'validarorganizacionef/:ef' , to: 'registrations#validar_organizacion_ef'
    
    get "recuperarcontrasenia", to: "devise/passwords#new", as: :new_cuenta_password
    post "recuperarcontrasenia", to: "devise/passwords#create", as: :cuenta_password
    
    get "cambiarcontrasenia", to: "devise/passwords#edit",  as: :edit_cuenta_password
    patch "cambiarcontrasenia", to: "devise/passwords#update" # , as: :edit_cuenta_password
    put "cambiarcontrasenia", to: "devise/passwords#update" #, as: :edit_cuenta_password
    
  end
  
  get 'micuenta', controller: 'mi_cuenta', action: 'index', as: :mi_cuenta
  get 'micuenta/dominios', controller: 'mi_cuenta/dominios', action: 'index', as: :mi_cuenta_dominios
  get 'micuenta/hospedaje', controller: 'mi_cuenta/hospedaje', action: 'index', as: :mi_cuenta_hospedaje
  get 'micuenta/balance', controller: 'mi_cuenta/balance', action: 'index', as: :mi_cuenta_balance
  get 'micuenta/configuracion', controller: 'mi_cuenta/configuracion', action: 'index', as: :mi_cuenta_configuracion
  
  get 'administracion', controller: 'administracion', action: 'index', as: :administracion
  get 'administracion/cuentas', controller: 'administracion/cuentas', action: 'index', as: :administracion_cuentas
  get 'administracion/pagos', controller: 'administracion/pagos', action: 'index', as: :administracion_pagos
  get 'administracion/compras', controller: 'administracion/compras', action: 'index', as: :administracion_compras
  get 'administracion/planesdominios', controller: 'administracion/planes_dominios', action: 'index', as: :administracion_planes_dominios
  get 'administracion/planeshospedaje', controller: 'administracion/planes_hospedaje', action: 'index', as: :administracion_planes_hospedaje
  get 'administracion/cuentasbancarias', controller: 'administracion/cuentas_bancarias', action: 'index', as: :administracion_cuentas_bancarias
  
  get 'servicios', controller: 'servicios', action: 'index', as: :servicios
  
  get 'servicios/dominios', controller: 'servicios/dominios', action: 'index', as: :servicios_dominios
  post 'servicios/dominios', controller: 'servicios/dominios', action: 'whois'
  
  get 'servicios/hospedaje', controller: 'servicios/hospedaje', action: 'index', as: :servicios_hospedaje
  
  get 'blog', controller: 'blog', action: 'index', as: :blog
  
  get 'clientes', controller: 'clientes', action: 'index', as: :clientes
  
  get 'carrito', controller: 'carrito', action: 'index', as: :carrito
  get 'carrito/agregar/:servicio/:plan', controller: 'carrito', action: 'agregar', as: :agregar_hospedaje_al_carrito
  get 'carrito/agregar/:servicio/:plan/:nombre_dominio', controller: 'carrito', action: 'agregar', as: :agregar_dominio_al_carrito
  get 'carrito/remover/:id', controller: 'carrito', action: 'remover', as: :remover_del_carrito
  get 'carrito/editararticulo/:id/:duracion', controller: 'carrito', action: 'alterar', as: :editar_articulo_del_carrito
  get 'carrito/pagar', controller: 'carrito', action: 'new', as: :pagar_carrito
  post 'carrito/pagar', controller: 'carrito', action: 'create'
  
  get 'nosotros', controller: 'nosotros', action: 'index', as: :nosotros
  
  get 'contacto', controller: 'contacto', action: 'new', as: :contacto
  post 'contacto', controller: 'contacto', action: 'create'
  
  
  root to: 'inicio#index'
  
end