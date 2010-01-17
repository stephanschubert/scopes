module ActiveRecord
  module Scopes
    module SearchBy

      SCOPES = {
        :contains                 => [ "LIKE",     "%", "%" ],
        :does_not_contain         => [ "NOT LIKE", "%", "%" ],
        :starts_with              => [ "LIKE",      "", "%" ],
        :does_not_start_with      => [ "NOT LIKE",  "", "%" ],
        :ends_with                => [ "LIKE",     "%",  "" ],
        :does_not_end_with        => [ "NOT LIKE", "%",  "" ],
        :is                       => [ "=",         "",  "" ],
        :is_not                   => [ "<>",        "",  "" ],
        :is_less_than             => [ "<",         "",  "" ],
        :is_less_than_or_equal    => [ "<=",        "",  "" ],
        :is_greater_than          => [ ">"          "",  "" ],
        :is_greater_than_or_equal => [ ">=",        "",  "" ],
      }
      
      def self.included(base)
        base.extend ClassMethods

        SCOPES.each do |name, (operator, prefix, suffix)|
          base.named_scope name, lambda { |column, value|
            { :conditions => [
              "LOWER(#{column}) #{operator} ?", 
              "#{prefix}#{value.is_a?(String) ? value.downcase : value}#{suffix}" 
              ]
            }
          }
        end
      end

      module ClassMethods

        def search_by_criteria(column, operator, value)
          scope = operator.to_s.gsub(" ", "_").to_sym
          send(scope, column, value)
        end
      
        def search_by(*all_criteria)
          scope = scoped({})
          all_criteria.each do |c|
            scope = scope.scoped(search_by_criteria(*c).proxy_options)
          end
          scope
        end

      end
  
    end
  end
end
