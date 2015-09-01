class AppHomeController < ApplicationController

  def index
  	@title = "Jerome's Pizza Home"
  	@pizzas = Product.all.sample 3
  	render ('index')
  end

  def about_us
  end


end
