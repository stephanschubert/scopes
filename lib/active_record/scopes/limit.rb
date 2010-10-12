module ActiveRecord
  module Scopes
    module Limit

      def self.included(base)
        base.scope :limit,    lambda { |n| { :limit => n || 5 } }
        base.scope :limit_to, lambda { |n| { :limit => n || 5 } }
      end

    end
  end
end
