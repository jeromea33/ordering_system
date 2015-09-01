class Product < ActiveRecord::Base

	has_many :order_products


	validates :name, :presence => true
	validates :name, :uniqueness => true
	validates :name, :length => {
		:maximum => 20
	}
	validates :details, :length => {
		:maximum => 100
	}
	validates :price, :numericality => true
end
