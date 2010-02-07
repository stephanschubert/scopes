module ActiveRecord
  module Scopes
    module LastModified

      def self.included(base)
        base.named_scope :last_modified, :order => "updated_at DESC"
      end
      
    end
  end
end
