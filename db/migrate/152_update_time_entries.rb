class UpdateTimeEntries < ActiveRecord::Migration
  def self.up
    change_table :time_entries do |t|
      t.column :accepted_report, :boolean
      t.column :accepted_report_user, :integer,  :null => true
      t.column :accepted_report_date, :datetime
    end
  end

  def self.down
    change_table :time_entries do |t|
      t.remove :accepted_report
      t.remove :accepted_report_user
      t.remove :accepted_report_date
    end
  end
end
