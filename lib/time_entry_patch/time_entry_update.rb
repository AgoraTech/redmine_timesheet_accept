module TimeEntryPatch
  module TimeEntryUpdate

    unloadable
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        safe_attributes 'accepted_report', 'accepted_report_user', 'accepted_report_date'
        before_validation :check_if_time_entry_is_not_accepted
        before_destroy :check_if_time_entry_is_not_accepted
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def check_if_time_entry_is_not_accepted
        if(self.id != nil)
          time_entry = TimeEntry.find(self.id)
          if(time_entry.accepted_report)
            errors.add :accepted_report, l(:report_is_accpeted)
          return false
          end
        end
      end

    end
  end
end

require_dependency 'time_entry'
TimeEntry.send(:include,  TimeEntryPatch::TimeEntryUpdate)
