class AddNameToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :name, :string
  end
end
