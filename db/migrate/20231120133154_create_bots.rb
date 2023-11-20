class CreateBots < ActiveRecord::Migration[7.1]
  def change
    create_table :bots do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_day

      t.timestamps
    end
  end
end
