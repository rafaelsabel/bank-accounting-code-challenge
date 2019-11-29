# frozen_string_literal: true

class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :source_account, references: :accounts, foreign_key: { to_table: :accounts }, index: true, null: false
      t.references :destination_account, references: :accounts, foreign_key: { to_table: :accounts }, index: true, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.timestamps
    end
  end
end
