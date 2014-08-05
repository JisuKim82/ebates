class AddKeywordsToStore < ActiveRecord::Migration
  def change
    add_column :stores, :keywords, :string
  end
end
