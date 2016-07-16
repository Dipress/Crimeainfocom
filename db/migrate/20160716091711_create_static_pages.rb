class CreateStaticPages < ActiveRecord::Migration[5.0]
  def change
    create_table :static_pages do |t|
      t.text :body
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
