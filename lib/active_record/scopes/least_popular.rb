module ActiveRecord
  module Scopes
    module LeastPopular

      def self.included(base)
        base.named_scope :least_popular, :order => "popularity ASC"
      end
      
    end
  end
end
