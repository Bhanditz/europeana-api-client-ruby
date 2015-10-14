module Europeana
  module API
    class Record
      class Hierarchy
        ##
        # Base class for common heirarchy API behaviour
        class Base
          include Requestable

          attr_accessor :params

          def initialize(id, params = {})
            @id = id
            @params = params
          end

          def parse_response(response, options = {})
            super.slice(:self, :children, :parent, 'preceeding-siblings', 'following-siblings', 'ancestors')
          end

          def request_url(_options = {})
            Europeana::API.url + "/record#{@id}/#{api_method}.json"
          end

          def api_method
            self.class.to_s.demodulize.underscore.dasherize
          end
        end
      end
    end
  end
end
