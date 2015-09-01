class OrderingController < ApplicationController

  def menu
  	@products = Product.all
  end

  def orders
  	@products = Product.all
  end
end
