Rails.application.routes.draw do

  devise_for :users
  get "home/read/:id",  to: "home#read" , :as => :post_read
  get "home/:tag/posts", to: "home#tag_search", :as=> :tag_search
  get "home/category/:category_slug", to: "home#category_search", :as=> :category_search
  #tag_search post_read are the alias for the route
  resources :posts
  #get 'tags/index'
  resources :categories
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #controllername/action name
  #only prefix is enough for it


  #Entry point of the server request is rout
  # and then it will move to specific controller
  #root to: "home#index"
  root "home#index"
  # : -> points to # -> action
  get 'home/ok'

  get 'home/index'

  get 'home/about', as: :about # we can access it as about_path or about_url
  get 'home/contact', as: :contact 

  #all the get are yielded first at application.html in 
  # in layout so if we add something to it
  # it will add that function/style to all pages
end
