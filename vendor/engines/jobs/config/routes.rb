::Refinery::Application.routes.draw do
  resources :jobs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :jobs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
