module ActiveRecord
  module Scopes
    module Limit

      def self.included(base)
        base.named_scope :limit,    lambda { |n| { :limit => n || 5 } }
        base.named_scope :limit_to, lambda { |n| { :limit => n || 5 } }
      end

    end
  end
end
