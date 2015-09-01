class OrderingController < ApplicationController

  def menu
  	@products = Product.all
  end

  def orders
  end
end
