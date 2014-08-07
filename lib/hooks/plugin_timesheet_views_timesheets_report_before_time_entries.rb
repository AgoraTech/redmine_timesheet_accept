module PluginTimesheetViewsTimesheetsReportBeforeTimeEntries
  class ViewHookListener < Redmine::Hook::ViewListener
    render_on :plugin_timesheet_views_timesheets_report_before_time_entries, :partial => "hooks_view/view_plugin_timesheet_views_timesheets_report_before_time_entries"
  end

end
