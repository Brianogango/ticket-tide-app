class AddReferenceNumberToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :reference_number, :string
  end
end
