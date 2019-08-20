module NinjaVan::Validations
  class OrderValidation

    def initialize(hash)
      @hash = hash.symbolize_keys
    end

    def validate!
      blank_params = []
      required_params.each do |field|
        blank_params << field if NinjaVan.is_blank?(hash[field.to_sym])
      end
      raise NinjaVan::BadParamsError.new("Params: [#{blank_params.join(', ')}] is blank!") unless blank_params.empty?
      return true
    end

    private

    attr_reader :hash

    DEFAULT_REQUIRED_PARAMS = [
      :service_type,
      :service_level,
      :from,
      :to,
      :parcel_job
    ]

    def required_params
      NinjaVan.setup.create_order_required_params || DEFAULT_REQUIRED_PARAMS
    end

  end
end
