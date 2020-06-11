Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/students/all', to: "students#index", as: "students"
  # get '/students/new', to: "students#new", as: "new_student"
  # get '/students/:id', to: "students#show", as: "student"
  # post '/students', to: 'students#create'
  # get '/students/:id/edit', to: 'students#edit', as: "edit_student"
  # patch '/students/:id', to: 'students#update'
  # delete '/students/:id', to: 'students#destroy'
  root 'students#index'
  #resources :students #, except: [:index, :show], will write all the routes for you if you're following the 7 rr convention
  #meaning your route names match with the methods in the controller that are the names of the restful routes
end
