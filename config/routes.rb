Rails.application.routes.draw do

  get("/", { :controller => "calc", :action => "home"})
  
  get("/flexible/square/:the_num", { :controller => "calc", :action => "flex_square"})
  
  get("/flexible/square_root/:the_num", { :controller => "calc", :action => "flex_square_root"})  
  
  get("/flexible/payment/:bps/:years/:pv", { :controller => "calc", :action => "flex_payment"})
  
  get("/flexible/random/:min/:max", { :controller => "calc", :action => "flex_random"})
  
  get("/square/new", { :controller => "calc", :action => "square_form_input"})
  get("/square/results", { :controller => "calc", :action => "square_form_results"})
  
  get("/square_root/new", { :controller => "calc", :action => "sqrt_form_input"})
  get("/square_root/results", { :controller => "calc", :action => "sqrt_form_results"})
  
  get("/payment/new", { :controller => "calc", :action => "payment_inputs"})
  get("/payment/results", { :controller => "calc", :action => "payment_results"})
  
  get("/random/new", { :controller => "calc", :action => "random_inputs"})
  get("/random/results", { :controller => "calc", :action => "random_results"})

  get("/word_count/new", { :controller => "calc", :action => "word_count_inputs"})
  get("/word_count/results", { :controller => "calc", :action => "word_count_results"})
  
  get("/descriptive_stats/new", { :controller => "calc", :action => "stats_input"})
  get("/descriptive_stats/results", { :controller => "calc", :action => "stats_results"})
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
