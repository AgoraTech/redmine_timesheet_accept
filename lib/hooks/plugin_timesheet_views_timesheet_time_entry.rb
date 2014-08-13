module PluginTimesheetViewsTimesheetTimeEntry
     class ViewHookListener < Redmine::Hook::ViewListener
    render_on :plugin_timesheet_views_timesheet_time_entry, :partial => "hooks_view/view_plugin_timesheet_views_timesheet_time_entry"
  end
end