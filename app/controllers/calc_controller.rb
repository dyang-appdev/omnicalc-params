class CalcController < ApplicationController

  def home
    render("calc_templates/home.html.erb")
  end
  
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
    @apr = params.fetch("user_apr").to_f 
    rate = @apr / 12 / 100
    @years = params.fetch("user_years").to_i
    @pv = params.fetch("user_pv").to_i
    amt_owed = @pv * rate
    months = @years * 12.0
    @monthly_pmt = amt_owed / (1 - (1 + rate)**-months)
    
    render("calc_templates/payment_results.html.erb")
  end
  
  def random_inputs
    render("calc_templates/random_inputs.html.erb")
  end
  
  def random_results
    @min = params.fetch("user_min").to_i
    @max = params.fetch("user_max").to_i
    @answer = rand(@min ... @max)
    render("calc_templates/random_results.html.erb")
  end
  
  def word_count_inputs
    render("calc_templates/word_count_inputs.html.erb")
  end
  
  def word_count_results
    @text = params.fetch("sample_text")
    @special_word = params.fetch("special_word")
    @word_count = @text.split.count
    @character_count_with_spaces = @text.length
    @character_count_without_spaces = @text.gsub(/\s+/, "").length
    @occurrences = @text.gsub(/[^a-z0-9\s]/i, "").downcase.split.count(@special_word.downcase)
   
    render("calc_templates/word_count_results.html.erb")
  end
  
  def stats_input
    render("calc_templates/stats_inputs.html.erb")
  end
  
  def stats_results
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)
    @sorted_numbers = @numbers.sort
    @count = @numbers.length
    @minimum = @numbers.min
    @maximum = @numbers.max
    @range = @maximum - @minimum

    ascend = @numbers.sort
    
    if ascend.count % 2 != 0 
      mid = (ascend.length - 1)/ 2.0
      median = ascend.at(mid)
    else
      mid1 = ascend.length / 2.0
      mid2 = (ascend.length / 2.0 ) - 1
      median = (ascend.at(mid1) + ascend.at(mid2)) / 2.0
    end
    
    @median = median
    
    @sum = @numbers.sum
    @mean = @sum / @count
    
    # Variance
    # ========
    
    squared_diff = []
  
    @numbers.each do |num|
      mean = @numbers.sum / @numbers.length
      diff = num - mean
      diff_squared = diff * diff
      squared_diff.push(diff_squared)
    end
    
    @variance = (squared_diff.sum / squared_diff.length)
    
    @standard_deviation = Math.sqrt(@variance)

    # Mode
    # ====
  
    mode = [0]
    count = [0]
    
    @numbers.each do |num|
      if @numbers.count(num) > count.first
        count.delete(count.first)
        count.push(@numbers.count(num))
        mode.delete(mode.first)
        mode.push(num)
      end
    end
  
    @mode = mode.first    
    
    render("calc_templates/stats_results.html.erb")
  end
end