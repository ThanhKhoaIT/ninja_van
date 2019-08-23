module NinjaVan
  class Request

    def self.post(endpoint, params={})
      full_endpoint = "#{NinjaVan.setup.require!(:domain)}#{endpoint}"
      response = Http.headers(content_type: 'application/json', accept: 'application/json')
        .auth("Bearer #{NinjaVan.setup.get_token_from_cache}")
        .post(full_endpoint, json: params)
      raise NinjaVan::ForbiddenError.new(full_endpoint) if response.code == 403
      raise NinjaVan::ServerError.new(full_endpoint) if response.code == 500
      raise NinjaVan::RequestError.new(response.parse) if response.parse.is_a?(Hash) && !response.parse['error'].nil?
      response.parse
    end

    def self.post_without_token(endpoint, params={})
      full_endpoint = "#{NinjaVan.setup.require!(:domain)}#{endpoint}"
      response = Http.headers(content_type: 'application/json', accept: 'application/json')
        .post(full_endpoint, json: params)
      raise NinjaVan::ForbiddenError.new(full_endpoint) if response.code == 403
      raise NinjaVan::ServerError.new(full_endpoint) if response.code == 500
      raise NinjaVan::RequestError.new(response.parse) unless response.parse['error'].nil?
      response.parse
    end

    def self.get(endpoint, params={})
      full_endpoint = "#{NinjaVan.setup.require!(:domain)}#{endpoint}"
      response = Http.headers(content_type: 'application/json', accept: 'application/json')
        .auth("Bearer #{NinjaVan.setup.get_token_from_cache}")
        .get(full_endpoint, params: params)
      raise NinjaVan::ForbiddenError.new(full_endpoint) if response.code == 403
      raise NinjaVan::NotFoundError.new(response.parse) if response.code == 404
      raise NinjaVan::ServerError.new(full_endpoint) if response.code == 500
      response.parse
    end

    def self.delete(endpoint, params={})
      full_endpoint = "#{NinjaVan.setup.require!(:domain)}#{endpoint}"
      response = Http.headers(content_type: 'application/json', accept: 'application/json')
        .auth("Bearer #{NinjaVan.setup.get_token_from_cache}")
        .delete(full_endpoint, params: params)
      raise NinjaVan::ForbiddenError.new(full_endpoint) if response.code == 403
      raise NinjaVan::NotFoundError.new(response.parse) if response.code == 404
      raise NinjaVan::ServerError.new(full_endpoint) if response.code == 500
      response.parse
    end

  end
end
