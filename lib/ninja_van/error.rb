module NinjaVan
  class Error < StandardError; end

  class RequestError < Error
    attr_reader :response

    delegate :message,
      :request_id,
      :code,
      :title,
      to: :error

    def initialize(response)
      super
      @response = response
    end

    def error
      @error ||= OpenStruct.new(response['error'])
    end
  end

  class ResponseError < Error
    attr_reader :error_data
    def initialize(error_data)
      super
      @error_data = error_data
    end
  end

  class ConfigError < Error; end
  class ForbiddenError < Error; end
  class ServerError < Error; end
  class BadParamsError < Error; end

  class CreateOrderError < ResponseError; end
  class NotFoundError < ResponseError; end
end
