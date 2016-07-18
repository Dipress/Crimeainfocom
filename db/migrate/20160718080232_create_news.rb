class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.text :body
      t.boolean :main_page, default: false
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
