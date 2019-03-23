class CreateEnumTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :enum_transitions do |t|
      t.integer :status, default: 0
      t.timestamps
    end
  end
end