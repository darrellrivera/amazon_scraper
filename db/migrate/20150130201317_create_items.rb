class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :target_price
      t.string :url

      t.timestamps
    end
  end
end
