class AddPriceToLineItem < ActiveRecord::Migration[5.2]
  def up
    add_column :line_items, :price, :decimal, default: 0, precision: 8, scale: 2
    
    LineItem.all.each do |li|
      li.price = li.product.price
      li.save!
    end
  end

  def down
    remove_column :line_items, :price
  end

end
