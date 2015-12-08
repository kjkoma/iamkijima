class CreateLoveyotubes < ActiveRecord::Migration
  def change
    create_table :loveyotubes do |t|
      t.string :loveword

      t.timestamps null: false
    end
  end
end
