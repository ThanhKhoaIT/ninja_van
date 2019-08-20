module NinjaVan
  class Order

    def self.create(serializer)
      create_data = NinjaVan::FlexibleParams.new(serializer).hash
      begin
        NinjaVan::Validations::OrderValidation.new(create_data).validate!
        NinjaVan::Request.post(NinjaVan.setup.create_endpoint, create_data)
      rescue => exception
        raise NinjaVan::CreateOrderError.new(create_data.merge({ error: exception.to_s }))
      end
    end

  end
end
