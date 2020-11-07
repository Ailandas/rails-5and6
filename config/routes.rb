Rails.application.routes.draw do
  get 'user/validate_user'
  get 'shop/items'
  get 'shop/nesiojami'
  get 'shop/namai'
  get 'shop/stacionarus'
  get 'user/registracija'
  post 'user/new'
  get 'user/prisijungti'
  post 'user/validation'
  post 'user/atsijungti'
  post 'user/trinti'
  post 'user/atnaujinti'
  get 'user/naudotojas'
  get 'user/naudotojai'
  get 'user/getuser'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
