class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|

  		t.string 'name', :null => false
  		t.decimal 'price', :null => false
  		t.text 'details', :null => false
  		t.string 'picture_url'

  		t.timestamps :null => false
  	end

  	add_index :products, :name
  end

  def down
  	drop_table :products
  end

end
