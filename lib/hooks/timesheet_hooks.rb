class TimesheetHooks < Redmine::Hook::ViewListener

  def plugin_timesheet_model_timesheet_conditions(context = { })
    timesheet = context[:timesheet];
    accepted_report_value = timesheet.accepted_report
    query = context[:conditions][0]
    if(accepted_report_value == nil || accepted_report_value == "null" || accepted_report_value == "0")
      query = query + " AND accepted_report is null or accepted_report = '0' "
    elsif(accepted_report_value == '1')
      query = query + " AND accepted_report = '1' "
    end
    context[:conditions][0] = query
  end

end

