class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :container_id
      t.string :packing_style
      t.float :length
      t.float :heigth
      t.float :width
      t.float :weigth
      t.string :cog_heigth_type
      t.float :cog_heigth

      t.timestamps
    end

  end
end
