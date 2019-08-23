module NinjaVan

  class ServiceTypes
    PARCEL = 'Parcel'
    RETURN = 'Return'
    MARKETPLACE = 'Marketplace'
    BULKY = 'Bulky'
    INTERNATIONAL = 'International'
    ALL = [PARCEL, RETURN, MARKETPLACE, BULKY, INTERNATIONAL]
  end

  class ServiceLevels
    STANDARD = 'Standard'
    EXPRESS = 'Express'
    SAMEDAY = 'Sameday'
    NEXTDAY = 'Nextday'
    ALL = [STANDARD, EXPRESS, SAMEDAY, NEXTDAY]
  end

  class Dimensions
    S   = 'S'
    M   = 'M'
    L   = 'L'
    XL  = 'XL'
    XXL = 'XXL'
    ALL = [S, M, L, XL, XXL]
  end

  class PickupServiceTypes
    SCHEDULED = 'Scheduled'
    ON_DEMAND = 'On-Demand'
    ALL = [SCHEDULED, ON_DEMAND]
  end

  class PickupServiceLevels
    STANDARD = 'Standard'
    PREMIUM = 'Premium'
    ALL = [STANDARD, PREMIUM]
  end

  class Timezones
    SINGAPORE = 'Asia/Singapore'
    KUALA_LUMPUR = 'Asia/Kuala_Lumpur'
    JAKARTA = 'Asia/Jakarta'
    JAYAPURA = 'Asia/Jayapura'
    MAKASSAR = 'Asia/Makassar'
    BANGKOK = 'Asia/Bangkok'
    MANILA = 'Asia/Manila'
    HO_CHI_MINH = 'Asia/Ho_Chi_Minh'
    YANGON = 'Asia/Yangon'
    ALL = [SINGAPORE, KUALA_LUMPUR, JAKARTA, JAYAPURA, MAKASSAR, BANGKOK, MANILA, HO_CHI_MINH, YANGON]
  end

  class PickupApproxVolumes
    FULL_VAN_LOAD = 'Full-Van Load'
    HALF_VAN_LOAD = 'Half-Van Load'
    LARGER_THAN_VAN_LOAD = 'Larger than Van Load'
    LESS_THAN_10_PARCELS = 'Less than 10 Parcels'
    LESS_THAN_3_PARCELS = 'Less than 3 Parcels'
    TROLLEY_REQUIRED = 'Trolley Required'
    ALL = [
      FULL_VAN_LOAD,
      HALF_VAN_LOAD,
      LARGER_THAN_VAN_LOAD,
      LESS_THAN_10_PARCELS,
      LESS_THAN_3_PARCELS,
      TROLLEY_REQUIRED,
    ]
  end

end
