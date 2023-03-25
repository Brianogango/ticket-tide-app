class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.string :event_location
      t.string :event_description
      t.string :poster_url
      t.decimal :event_price
      t.integer :total_tickets
      t.time :start_time
      t.time :end_time
      t.string :contact
      t.integer :age_restriction
      t.text :ticket_info
      t.text :lineup

      t.timestamps
    end
  end
end
