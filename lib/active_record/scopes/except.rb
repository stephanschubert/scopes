module ActiveRecord
  module Scopes
    module Except

      def self.included(base)
        base.named_scope :except, lambda { |*records|
          { :conditions => [ "id NOT IN (?)", records ] }
        }
      end
      
    end
  end
end
