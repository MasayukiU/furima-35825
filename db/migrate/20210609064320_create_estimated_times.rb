class CreateEstimatedTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :estimated_times do |t|

      t.timestamps
    end
  end
end
