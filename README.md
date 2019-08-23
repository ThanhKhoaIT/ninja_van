# NinjaVan API Caller
**GHTK Documentation:** https://ninjaorderapibeta.docs.apiary.io

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ninja_van'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ninja_van

## Setup for Rails

Add `config/initializers/ninjavan.rb` file
```ruby
  NinjaVan.setup do |config|
    # Add your config diff by the environment
    config.domain = Rails.application.secrets.ninjavan_endpoint
    config.client_id = Rails.application.secrets.ninjavan_client_id
    config.client_secret = Rails.application.secrets.ninjavan_client_secret
    config.grant_type = :client_credentials

    # Set class for getting token from the cache to optimize request getting a new token
    config.get_token_from_cache_klass = Ninjavan::AccessTokenFromCacheService

    config.get_access_token_endpoint = '/2.0/oauth/access_token'
    config.create_endpoint = '/4.1/orders'
    config.get_detail_endpoint = '/3.0/orders'
    config.get_status_endpoint = '/2.0/track'
    config.cancel_endpoint = '/2.2/orders/'
  end
```

**Example** for `Ninjavan::AccessTokenFromCacheService` class
```ruby
module Ninjavan
  class AccessTokenFromCacheService
    def call
      token = Rails.cache.fetch('ninjavan_token')
      return token if token
      response = NinjaVan::AccessToken.get
      Rails.cache.fetch('ninjavan_token', expires_in: response['expires_in'] - 5.minute) { response["access_token"] }
    end
  end
end
```

## Usage
#### How to create Order
With **ActiveModel::Serializer**
```ruby
  serializer = NinjavanSerializer.new(Shipment.last)
  NinjaVan::Order.create(serializer)
```
Or by **Hash**

```ruby
  request_data = {...}
  NinjaVan::Order.create(request_data)
```
- Request data: [view JSON file](https://bit.ly/33RJicn)
- Success response: [view JSON file](https://bit.ly/2Ziswoh)

- Ninjavan documentation: [detail](https://ninjaorderapibeta.docs.apiary.io/#reference/0/create-order-v41-latest/post)

#### How to get Order detail
```ruby
  NinjaVan::Order.get_detail(tracking_id: 'NVSG00000000000000')
```

#### How to get Order status
```ruby
  NinjaVan::Order.get_status(trackingIds: ['NVSG00000000000000'])
```

#### How to cancel Order
```ruby
  NinjaVan::Order.cancel('NVSG00000000000000')
```
