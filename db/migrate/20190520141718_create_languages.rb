class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :title
      t.decimal :percent, precision: 5, scale: 2
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
