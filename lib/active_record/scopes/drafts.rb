module ActiveRecord
  module Scopes
    module Drafts

      def self.included(base)
        base.scope :drafts, :conditions => { :published_at => nil }
      end

    end
  end
end
