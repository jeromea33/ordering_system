class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
  		t.string 'client_name', :null => false
  		t.string 'client_address', :null => false
  		t.datetime 'order_datetime', :null => false
  		t.decimal 'overall_price'
      	t.timestamps null: false
    end

    add_index :orders, :client_name
  end

  def down
  	drop_table :orders
  end

end
