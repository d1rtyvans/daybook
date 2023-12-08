module Daybook
  module Mixins
    module Configurable
      class << self
        def included(base)
          base.include(InstanceMethods)
        end

        module InstanceMethods
          def config
            Daybook.configuration
          end
        end
      end
    end
  end
end
