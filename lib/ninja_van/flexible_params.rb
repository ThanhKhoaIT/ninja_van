module NinjaVan
  class FlexibleParams

    attr_reader :hash

    def initialize(object)
      case object
      when Hash
        @hash = object
      else
        @hash = object.attributes
      end
    end

  end
end
