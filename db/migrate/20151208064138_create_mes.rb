class CreateMes < ActiveRecord::Migration
  def change
    create_table :mes do |t|
      t.string :name
      t.string :birthcity
      t.date :birthday
      t.string :livingplace

      t.timestamps null: false
    end
  end
end
