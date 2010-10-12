module ActiveRecord
  module Scopes
    module OrderBy

      def self.included(base)
        base.extend ClassMethods

        base.scope :order_by, lambda { |*order|
          how_to_order = base.convert_ordering_to_sql(order.flatten.first || default_ordering)
          { :order => how_to_order }
        }
      end

      module ClassMethods

        def default_ordering
          { :created_at => :desc }
        end

        def convert_ordering_to_sql(hash)
          column    = hash.keys.first
          direction = hash[column].to_s.upcase

          unless %(ASC DESC).include?(direction)
            raise ArgumentError, "Only ASC or DESC allowed."
          end

          "`#{column}` #{direction}"
        end

        def ordered_by(clause)
          (class << self; self; end).instance_eval {
            define_method(:default_ordering) { clause }
          }
        end

      end

    end
  end
end
