class CreateOldLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :old_links do |t|
      t.string :slug
      t.references :static_page, foreign_key: true

      t.timestamps
    end
  end
end
