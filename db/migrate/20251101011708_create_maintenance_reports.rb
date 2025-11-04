class CreateMaintenanceReports < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenance_reports do |t|
      t.integer :car_id
      t.jsonb :pdf_data
      t.timestamps
    end
  end
end
