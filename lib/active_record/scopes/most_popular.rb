module ActiveRecord
  module Scopes
    module MostPopular

      def self.included(base)
        base.named_scope :most_popular, :order => "popularity DESC"
      end
      
    end
  end
end
