class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.string     :week_day  #deberia llamarse weed_day
      t.time       :course_start_time
      t.integer    :period

      t.timestamps
    end
  end
end
