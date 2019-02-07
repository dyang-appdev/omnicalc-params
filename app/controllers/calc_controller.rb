class CalcController < ApplicationController

  def flex_square
    # The parameters look like this: {"the_num" => "42"}
    # Rails put that hash in a variable called params 
    # params = {"the_num" => "42"}
  
    @num = params.fetch("the_num").to_i
    @answer = @num ** 2
    
    render("calc_templates/flexible_square.html.erb")
  end
  
  def flex_square_root
    @num = params.fetch("the_num").to_i
    @answer = Math.sqrt(@num)
    
    render("calc_templates/flexible_square_root.html.erb")
  end
  
  def flex_payment
    @bps = params.fetch("bps").to_f / 100
    rate = @bps / 12 / 100
    @years = params.fetch("years").to_i
    @pv = params.fetch("pv").to_i
    amt_owed = @pv * rate
    months = @years * 12.0
    @monthly_pmt = amt_owed / (1 - (1 + rate)**-months)
    
    render("calc_templates/flexible_payment.html.erb")
  end
  
  def flex_random
    @min = params.fetch("min").to_i
    @max = params.fetch("max").to_i
    @rand = rand(@min ... @max)
    
    render("calc_templates/flexible_random.html.erb")
  end
  
  def square_form_input
    render("calc_templates/square_form_input.html.erb")
  end
  
  def square_form_results
    @input = params.fetch("user_number").to_f
    @answer = @input ** 2
    render("calc_templates/square_form_results.html.erb")
  end
  
  def sqrt_form_input
    render("calc_templates/sqrt_form_input.html.erb")
  end
  
  def sqrt_form_results
    @input = params.fetch("user_number").to_f
    @answer = Math.sqrt(@input)
    render("calc_templates/sqrt_form_results.html.erb")
  end
  
  def payment_inputs
    render("calc_templates/payment_inputs.html.erb")
  end
  
  def payment_results
    render("calc_templates_payment_results.html.erb")
  end
end