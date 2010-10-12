module ActiveRecord
  module Scopes
    module LeastPopular

      def self.included(base)
        base.scope :least_popular, :order => "popularity ASC"
      end

    end
  end
end
