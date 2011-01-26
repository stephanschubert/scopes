module ActiveRecord
  module Scopes
    module Except

      def self.included(base)
        base.scope :except, lambda { |*records|
          if records.compact.blank?
            {}
          else
            { :conditions => [ "id NOT IN (?)", records ] }
          end
        }
      end

    end
  end
end
