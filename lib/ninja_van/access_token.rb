module NinjaVan
  class AccessToken

    def self.get
      NinjaVan::Request.post_without_token(NinjaVan.setup.require!(:get_access_token_endpoint), {
        grant_type: NinjaVan.setup.require!(:grant_type),
        client_id: NinjaVan.setup.require!(:client_id),
        client_secret: NinjaVan.setup.require!(:client_secret),
      })
    end

  end
end
