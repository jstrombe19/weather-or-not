class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.string :weather
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
