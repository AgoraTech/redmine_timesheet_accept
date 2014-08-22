module PluginTimesheetViewsTimesheetsReportBeforeTimeEntries
  class ViewHookListener < Redmine::Hook::ViewListener
    render_on :plugin_timesheet_view_timesheet_form, :partial => "hooks_view/view_plugin_timesheet_view_timesheet_form"
  end

end
