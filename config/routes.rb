Rails.application.routes.draw do
  root "articles#index"     # "articles#index" means the 'articles' controller,
                                # but the 'index' action in that controller

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"  #:id is a parameter
end
