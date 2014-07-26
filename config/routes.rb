ReporteDeHoras::Application.routes.draw do

  

devise_for :users
resources :courses  




 devise_scope :user do
   root to: "devise/sessions#new"
 end


end
