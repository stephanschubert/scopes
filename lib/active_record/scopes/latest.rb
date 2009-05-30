module ActiveRecord
  module Scopes
    module Latest

      def self.included(base)
        base.named_scope :latest, :order => "created_at DESC"
      end
      
    end
  end
end
