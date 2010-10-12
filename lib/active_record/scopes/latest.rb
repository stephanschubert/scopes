module ActiveRecord
  module Scopes
    module Latest

      def self.included(base)
        base.scope :latest, :order => "created_at DESC"
      end

    end
  end
end
