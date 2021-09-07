Rails.application.routes.draw do


  devise_for :users
  
  root to: "home#index"

  get 'test', to: 'home#test', as: 'test'
  post "/update_time", to: 'user_responses#update_time'
  post "/auto_submit/:id", to: 'user_responses#auto_submit'

  # get "/update_time", to: 'user_responses#update_time'

  get 'candidate_dashboard', to: 'dashboard#candidate', as: 'candidate_dashboard'
  get 'assessor_dashboard', to: 'dashboard#assessor', as: 'assessor_dashboard'
  get 'content_creator_dashboard', to: 'dashboard#content_creator', as: 'content_creator_dashboard'
  get 'admin_dashboard', to: 'dashboard#admin', as: 'admin_dashboard'
  get 'user_permisssion', to: 'dashboard#user_permissions', as: 'user_permissions'
  get 'update_role/:user_id/:role_id', to: 'dashboard#update_role', as: 'update_role'

  get 'walk_in_tests/:casestudy_id/:assessor_id', to: 'casestudy_users#create_user_and_assign_casestudy_form', as:'walk_in_tests'
  post 'walk_in_tests/:casestudy_id/:assessor_id', to: 'casestudy_users#create_user_and_assign_casestudy'

  # resource :casestudy_users
  delete 'question_traits/:id', to: 'question_traits#destroy', as: 'delete_quesion_trait'

  resources :casestudy_users , only: [:index, :new, :create] do
    resources :user_responses, only: [:index, :update]
    get '/user_responses/submit', to: 'user_responses#submit', as: 'final_submit'
    get '/user_responses/exam', to: 'user_responses#exam', as: 'start_exam'

  end
  resources :traits
  resources :casestudies do
    resources :pages
    resources :questions do
      get 'assign_trait', to: 'questions#assign_trait'
      post 'assign_trait', to: 'questions#assign_trait'
    end
  end



  # get 'casestudies', to: 'casestudies#index', as: 'casestudies'
  # get 'casestudies/new', to: 'casestudies#new', as: 'new_casestudy'
  # post 'casestudies', to: 'casestudies#create'
  # get 'casestudies/:casestudy_id', to: 'casestudies#show', as:'casestudy'
  # get 'casestudies/:casestudy_id/edit', to: 'casestudies#edit', as:'edit_casestudy'
  # patch 'casestudies/:casestudy_id', to: 'casestudies#update'
  # put 'casestudies/:casestudy_id', to: 'casestudies#update'


  # post 'casestudies/:casestudy_id/pages', to: 'casestudies#create_page', as: 'casestudies_create_page'
  # patch 'casestudies/:casestudy_id/pages', to: 'casestudies#update_page', as: 'casestudies_update_page'
  # put 'casestudies/:casestudy_id/pages/:id', to: 'casestudies#update_page'



  # post 'casestudies/:casestudy_id/questions', to: 'casestudies#create_question', as: 'casestudies_create_question'
  # patch 'casestudies/:casestudy_id/questions', to: 'casestudies#update_question', as: 'casestudies_update_question'
  # put 'casestudies/:casestudy_id/questions/:id', to: 'casestudies#update_question'




end
