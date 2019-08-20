module NinjaVan
  class Error < StandardError; end
  class ConfigError < Error; end
  class ForbiddenError < Error; end
  class ServerError < Error; end
  class RequestError < Error; end
  class CreateOrderError < Error; end
  class BadParamsError < Error; end
end
