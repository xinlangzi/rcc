::Refinery::Application.routes.draw do
  resources :ads, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :ads, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
