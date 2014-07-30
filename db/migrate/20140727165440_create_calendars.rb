class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.belongs_to :report
      t.string     :month
      t.string     :week_day
      t.integer    :day_of_month
      t.integer    :year
      t.integer    :period
      t.boolean    :holiday

      t.timestamps
    end
  end
end
