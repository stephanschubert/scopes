module ActiveRecord
  module Scopes
    module Published

      def self.included(base)
        base.scope :published, :conditions => [
          "published_at IS NOT NULL AND published_at < ?", Time.now
        ]
      end

    end
  end
end
