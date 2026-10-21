# Password Strength API - Ruby Gem

Password Strength is a password strength checker API that scores how strong a password is. It returns a strength label and score, a breakdown of the character types used, weak-pattern detection, theoretical entropy in bits, and recommendations to improve it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_passwordstrength'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_passwordstrength
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_passwordstrength'

# Initialize the client
client = APIVerve::Passwordstrength::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ password: "Password123" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ password: "Password123" })
  puts response["data"]
rescue APIVerve::Passwordstrength::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Passwordstrength::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Passwordstrength::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "strength": "weak",
    "score": 1,
    "passwordInfo": {
      "length": 11,
      "hasSpecialCharacters": false,
      "hasNumbers": true,
      "hasLowercase": true,
      "hasUppercase": true,
      "hasSpaces": false,
      "hasSequentialChars": true,
      "hasRepeatedChars": false
    },
    "recommendations": [
      "Use at least 12 characters",
      "Add special characters",
      "Avoid sequential characters (e.g. abc, 123)"
    ],
    "entropyBits": 65.5
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/passwordstrength?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/passwordstrength?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/passwordstrength?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
