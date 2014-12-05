class AcceptsController < ApplicationController
  def acceptreport
    logger.info 'siemka'
    bulk_update_with_bulk_update_accept_report(params)
  end

  def bulk_update_with_bulk_update_accept_report(params)
    attributes = parse_params_for_bulk_time_entry_attributes(params)
    unsaved_time_entry_ids = []

    if(paramsHasAcceptParameter(params))
      if Timesheet.currentUserCanAcceptReport
        acceptedReportDate = DateTime.now
        acceptedReportUserId = User.current.id
        logger.info params["time_entry"]
        timeentries = find_time_entries(params)

        logger.info "befaore find time entries"
        logger.info timeentries

        timeentries.each do |time_entry|
          time_entry.reload

          if(!time_entry.accepted_report)
            time_entry.update_column("accepted_report", true)
            time_entry.update_column("accepted_report_user", acceptedReportUserId)
            time_entry.update_column("accepted_report_date", acceptedReportDate)
          end
        end
      end

      logger.info "User '#{User.current.login}' accept report at #{acceptedReportDate}"
    end
    redirect_to :action=>"index", :controller=>"timesheet"

  end

  def paramsHasAcceptParameter(params)
    if(params.include? "time_entry")
      timeEntryFromRequest = params["time_entry"]
      if(timeEntryFromRequest.include? "accepted_report")
        accepted = timeEntryFromRequest["accepted_report"]
        if(accepted == "1")
        return true
        end
      end
    end
    return false
  end

  def find_time_entries(params)
    logger.info "time_entries start find"
    time_entries = TimeEntry.where(:id => params[:id] || params[:ids]).all
    logger.info time_entries
    return time_entries
  end

  def parse_params_for_bulk_time_entry_attributes(params)
    attributes = (params[:time_entry] || {}).reject {|k,v| v.blank?}
    attributes.keys.each {|k| attributes[k] = '' if attributes[k] == 'none'}
    attributes[:custom_field_values].reject! {|k,v| v.blank?} if attributes[:custom_field_values]
    attributes
  end
end
