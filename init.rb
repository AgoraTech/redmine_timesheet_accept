require_dependency 'time_entry_patch/time_entry_update'
require_dependency 'hooks/plugin_timesheet_views_timesheets_report_before_time_entries'
require_dependency 'hooks/add_attributes_to_time_entry_before_save_hooks'
require_dependency 'controllers_patch/acceptreport_controller'


Redmine::Plugin.register :redmine_timesheet_accept do
  name 'Redmine Timesheet Accept plugin'
  author 'agora'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/AgoraTech/redmine_timesheet_accept'
  author_url 'https://github.com/AgoraTech'
end
