class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end
  end
end
