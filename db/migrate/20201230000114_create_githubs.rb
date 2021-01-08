class CreateGithubs < ActiveRecord::Migration[6.0]
  def change
    create_table :githubs do |t|
      t.string :title
      t.string :url
      t.string :languages
      t.date :date

      t.timestamps
    end
  end
end
