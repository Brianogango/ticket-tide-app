class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :booking_date
      t.string :ticket_type
      t.boolean :paid

      t.timestamps
    end
  end
end
