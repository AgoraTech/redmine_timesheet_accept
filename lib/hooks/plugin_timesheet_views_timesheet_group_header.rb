module PluginTimesheetViewsTimesheetTimeEntry
  class ViewHookListener < Redmine::Hook::ViewListener
    render_on :plugin_timesheet_views_timesheet_group_header, :partial => "hooks_view/view_plugin_timesheet_views_timesheet_group_header"
  end
end
