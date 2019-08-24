module NinjaVan
  class Order

    def self.create(serializer)
      create_data = NinjaVan::FlexibleParams.new(serializer).hash
      begin
        NinjaVan::Validations::OrderValidation.new(create_data).validate!
        NinjaVan::Request.post(NinjaVan.setup.require!(:create_endpoint), create_data)
      rescue NinjaVan::RequestError => exception
        raise NinjaVan::CreateOrderError.new(create_data.merge(exception.response.to_deep_symbolize_keys))
      rescue => exception
        raise NinjaVan::CreateOrderError.new(create_data.merge({ error: exception.to_s }))
      end
    end

    # Params: tracking_id: tracking_code
    def self.get_detail(params)
      NinjaVan::Request.get(NinjaVan.setup.require!(:get_detail_endpoint), params)
    end

    # Params: trackingIds: [tracking_code1, tracking_code2]
    def self.get_status(params)
      NinjaVan::Request.post(NinjaVan.setup.require!(:get_status_endpoint), params)
    end

    # Params: NVSG00000000000000
    def self.cancel(tracking_code)
      NinjaVan::Request.delete(NinjaVan.setup.require!(:cancel_endpoint) << tracking_code)
    end

  end

end
