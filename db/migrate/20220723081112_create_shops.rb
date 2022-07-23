class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|

      t.timestamps
      t.string      :name
        t.text        :text
    end
  end
end
