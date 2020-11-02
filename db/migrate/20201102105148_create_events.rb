class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :owner, index: true
      t.string :title
      t.text :description
      t.datetime :start_date
      t.integer :duration
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
