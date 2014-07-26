class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :programa
      t.string  :nombre
      t.integer :semestre
      t.integer :duracion
      t.integer :creditos
      t.string  :area
      t.integer :user_id

      t.timestamps
    end
  end
end
