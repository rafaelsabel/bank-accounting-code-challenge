# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 200, null: false
      t.string :email, limit: 100, null: false
      t.timestamps
    end
  end
end
