# frozen_string_literal: true

class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, %i[uid provider], unique: true
  end
end
