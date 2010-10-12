module ActiveRecord
  module Scopes
    module Paged

      def self.included(base)
        base.scope :paged, lambda { |*args|
          options  = args.extract_options!
          page     = options[:page]     || 0
          per_page = options[:per_page] || 10

          { :limit => per_page, :offset => (per_page * page) }
        }
      end

    end
  end
end
