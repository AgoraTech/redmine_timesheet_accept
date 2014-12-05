Redmine timesheet accept report
========================

== Introduction

Plugin extends model time_entries by adding 3 columns: accepted_report, accepted_report_user, accepted_report_date.
Plugin provides button on the timesheet page and on-click triggers operation updating time_entries which being selected and which be not accepted yet, updating operation consists on the set appropriate value in above 3 columna


== Installation and Setup

1. In your redmine plugins directory, (bitnami redmine-2.5.2-0/apps/redmine/htdocs/plugins) run the command: https://github.com/AgoraTech/redmine_timesheet_accept.git
2. In your redmine bin directory (redmine-2.5.2-0/apps/redmine/htdocs/bin) run: bundle exec rake redmine:plugins:migrate
3. Install plugin https://github.com/arkhitech/redmine_timesheet_plugin
3. Add to role permission redmine_timesheet_accept_button and associate it with user.

License
---------

BaseController is released on the BSD 2-clause license. The product is not suitable for consumer use.

You can get the license in "license.md" file available in this repository.
