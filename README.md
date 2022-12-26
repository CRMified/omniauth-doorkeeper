# omniauth-timelyapp

[OmniAuth](https://github.com/intridea/omniauth) Strategy for [timelyapp.com](timelyapp.com).

## Basic Usage

```ruby
require "sinatra"
require "omniauth"
require "omniauth-doorkeeper"

class MyApplication < Sinatra::Base
  use Rack::Session
  use OmniAuth::Builder do
    provider :timelyapp, ENV['OAUTH_DOORKEEPER_CLIENT_ID'], ENV['DOORKEEPER_CLIENT_SECRET']
  end
end
```


## Resources

