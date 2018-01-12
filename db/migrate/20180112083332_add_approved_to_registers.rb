class AddApprovedToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :registers, :approved, :boolean, default: false
  end
end
