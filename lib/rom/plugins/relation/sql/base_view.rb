module ROM
  module Plugins
    module Relation
      module SQL
        module BaseView
          # @api private
          def self.included(klass)
            super
            klass.class_eval do
              view(:base) do
                header { dataset.columns }
                relation { select(*attributes(:base)).order(primary_key) }
              end
            end
          end
        end
      end
    end
  end

  plugins do
    adapter :sql do
      register :base_view, Plugins::Relation::SQL::BaseView, type: :relation
    end
  end
end