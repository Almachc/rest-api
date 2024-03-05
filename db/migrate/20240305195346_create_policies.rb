class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.date :effective_from, null: false
      t.date :effective_until, null: false
      t.references :vehicle, null: false, foreign_key: true
      t.references :insured, null: false, foreign_key: true

      t.timestamps
    end
  end
end
