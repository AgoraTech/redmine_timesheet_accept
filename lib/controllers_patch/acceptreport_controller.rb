module ControllersPatch
  module AcceptreportController

    unloadable
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :bulk_update, :bulk_update_accept_report
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def bulk_update_with_bulk_update_accept_report
        attributes = parse_params_for_bulk_time_entry_attributes(params)
        unsaved_time_entry_ids = []
        @time_entries.each do |time_entry|
          time_entry.reload
          time_entry.safe_attributes = attributes

          if(paramsHasAcceptParameter(params))
            logger.info time_entry.accepted_report
            if(!time_entry.accepted_report)
              time_entry.update_column("accepted_report", 1)
              time_entry.update_column("accepted_report_user", User.current.id)
              time_entry.update_column("accepted_report_date", Time.now.utc)
            end
          else
            call_hook(:controller_time_entries_bulk_edit_before_save, { :params => params, :time_entry => time_entry })
            unless time_entry.save
            unsaved_time_entry_ids << time_entry.id
            end
          end

        end
        set_flash_from_bulk_time_entry_save(@time_entries, unsaved_time_entry_ids)
        redirect_back_or_default project_time_entries_path(@projects.first)
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
    end
  end
end

require_dependency 'timelog_controller'
TimelogController.send(:include,  ControllersPatch::AcceptreportController)

