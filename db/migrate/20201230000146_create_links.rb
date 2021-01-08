class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :topic
      t.string :url
      t.date :date

      t.timestamps
    end
  end
end
