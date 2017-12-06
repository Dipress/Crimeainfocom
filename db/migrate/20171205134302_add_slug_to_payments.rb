class AddSlugToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :slug, :string
    add_index :payments, :slug
  end
end
