class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :packing_style
      t.float :lenght
      t.float :height
      t.float :width
      t.float :weight
      t.string :cog_height_type
      t.float :cog_height

      t.timestamps
    end
  end
end
