# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :client, index: true, foreign_key: true, null: false
      t.decimal :balance, precision: 20, scale: 2, null: false
      t.timestamps
    end
  end
end
