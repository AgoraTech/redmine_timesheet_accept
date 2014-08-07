class UpdateTimeEntries < ActiveRecord::Migration
  def self.up
    change_table :time_entries do |t|
      t.column :acceptedl_raport, :boolean
      t.column :accepted_raport_user, :integer,  :null => true
    end
  end

  def self.down
    change_table :time_entries do |t|
      t.remove :accepted_raport
      t.remove :accepted_raport_user
    end
  end
end
