class AddAttributesToTimeEntryBeforeSaveHooks < Redmine::Hook::ViewListener
  def controller_time_entries_bulk_edit_before_save (context = {})
    timeEntry = context[:time_entry]
    timeEntry.safe_attributes=({"accepted_report_user" => User.current.id})
  end

end
