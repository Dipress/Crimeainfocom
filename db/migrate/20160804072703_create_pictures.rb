class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :file
      t.references :imageable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
