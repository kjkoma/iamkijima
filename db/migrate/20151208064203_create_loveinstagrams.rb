class CreateLoveinstagrams < ActiveRecord::Migration
  def change
    create_table :loveinstagrams do |t|
      t.string :loveword

      t.timestamps null: false
    end
  end
end
