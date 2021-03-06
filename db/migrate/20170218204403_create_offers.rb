class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, foreign_key: true, null: false, type: :uuid
      t.uuid :customer, foreign_key: true, null: true, type: :uuid
      t.datetime :expire

      t.timestamps
    end
  end
end
