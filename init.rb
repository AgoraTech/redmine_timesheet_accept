
Redmine::Plugin.register :redmine_timesheet_accept do
  name 'Redmine Timesheet Accept plugin'
  author 'agora'
  description 'This is a plugin for Redmine'
  version '0.0.3'
  url 'https://github.com/AgoraTech/redmine_timesheet_accept'
  author_url 'https://github.com/AgoraTech'
  permission :redmine_timesheet_accept_button, {}
end
require 'redmine'
require_dependency 'time_entry_patch/time_entry_update'
require_dependency 'hooks/plugin_timesheet_views_timesheets_report_before_time_entries'
require_dependency 'hooks/plugin_timesheet_views_timesheet_time_entry'
require_dependency 'hooks/plugin_timesheet_views_timesheet_group_header'
require_dependency 'controllers_patch/acceptreport_controller'

require_dependency 'accepts_controller'
require_dependency 'hooks/plugin_timesheet_view_timesheet_form'
require_dependency 'timesheet_patches/filter_time_entry'
require_dependency 'hooks/timesheet_hooks'