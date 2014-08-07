module TimeEntryPatch
  module TimeEntryUpdate

    unloadable
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        safe_attributes 'accepted_raport', 'accepted_raport_user'
      end
    end

    module ClassMethods
    end

    module InstanceMethods
    end
  end
end

require_dependency 'time_entry'
TimeEntry.send(:include,  LogTimeValidation::Patches::ValidateTime)