module ActiveRecord
  module Scopes
    module MostPopular

      def self.included(base)
        base.scope :most_popular, :order => "popularity DESC"
      end

    end
  end
end
