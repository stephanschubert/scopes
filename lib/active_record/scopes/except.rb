module ActiveRecord
  module Scopes
    module Except

      def self.included(base)
        base.scope :except, lambda { |*records|
          # Ensure we got only valid records from the DB
          records = records.compact.reject do |r|
            r.respond_to?(:new_record?) ? r.new_record? : true
          end

          if records.blank?
            {}
          else
            { :conditions => [ "id NOT IN (?)", records ] }
          end
        }
      end

    end
  end
end
