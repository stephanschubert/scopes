module ActiveRecord
  module Scopes
    module Drafts

      def self.included(base)
        base.named_scope :drafts, :conditions => { :published_at => nil }
      end
      
    end
  end
end
