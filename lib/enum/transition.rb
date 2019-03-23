module Enum
  module Transition
    extend ActiveSupport::Concern

    def self.included(base)
      base.class_eval do
        after_validation :ensure!
        base.extend ClassMethods
      end
    end

    module ClassMethods
      def enum_columns columns
        instance_variable_set("@enum_columns_array", columns)
      end

      def enum_transitions from_transition, to_transitions
        to_transitions.each do |to_transition|
          define_method "#{from_transition}_to_#{to_transition}" do
            true
          end
        end
      end
    end

    def ensure!
      self.class.name.constantize.instance_variable_get('@enum_columns_array').each do |column|
        if !self.new_record?  && self.send("#{column}_changed?")
          unless self.respond_to? "#{self.send("#{column}_was")}_to_#{self.send("#{column}")}"
            self.errors.add(:base, "Status can't be changed from #{self.send("#{column}_was")} to #{self.send("#{column}")}")
          end
        end
      end
    end
  end
end