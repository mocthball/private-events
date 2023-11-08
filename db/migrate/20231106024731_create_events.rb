class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
