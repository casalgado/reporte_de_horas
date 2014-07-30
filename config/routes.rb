ReporteDeHoras::Application.routes.draw do

  


devise_for :users
resources :courses  
resources :reports

resource :user, except: [:index, :destroy, :new, :create] do
  resources :reports,     only: [] do
    collection do
    	get 'monthly_reports'
      get 'my_reports'
      get 'calendar_reports'
    end
  end
end


 devise_scope :user do
   root to: "devise/sessions#new"
 end


end
