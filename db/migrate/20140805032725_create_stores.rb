class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :cash_back

      t.timestamps
    end
  end
end
