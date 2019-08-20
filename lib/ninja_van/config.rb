module NinjaVan
  class Config

    attr_accessor :domain
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :grant_type

    attr_accessor :get_token_from_cache_klass

    attr_accessor :get_access_token_endpoint
    attr_accessor :create_endpoint
    attr_accessor :get_detail_endpoint
    attr_accessor :get_status_endpoint
    attr_accessor :cancel_endpoint

    attr_accessor :create_order_required_params

    def get_token_from_cache
      if self.get_token_from_cache_klass.is_a?(Class)
        self.get_token_from_cache_klass.new.call
      else
        raise NinjaVan::ConfigError.new("get_token_from_cache_klass is not class!")
      end
    end

    def require!(key)
      setup_value = self.send(key)
      raise NinjaVan::ConfigError.new("#{key} is nil!") if setup_value.nil?
      return setup_value
    end

  end
end
