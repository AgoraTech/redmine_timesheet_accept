module TimesheetPatches
  module FilterTimeEntry
    unloadable
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :initialize, :initialize_accept
        attr_accessor :accepted_report
      end

    end

    module ClassMethods
    end

    module InstanceMethods
      def initialize_with_initialize_accept(options = { })
        self.accepted_report = options[:accepted_report] || "all"
        initialize_without_initialize_accept(options)
      end
    end
  end
end

ActionDispatch::Callbacks.to_prepare do
  Timesheet.send(:include,  TimesheetPatches::FilterTimeEntry)
end