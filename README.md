# IoC

## Installation
```ruby
gem 'ruby-ioc'
```
And then execute:
```
$ bundle install
```
  

Or install it yourself as:
```
$ gem install ruby-ioc
```

## Usage

```ruby

IoC::Container.init do |container|
  # singleton value
  container.register(:checkout_repository, CheckoutRepository)
  
  # new instance value
  container.register(:checkout_service) { CheckoutService.new }
end

class  CheckoutService
  inject :checkout_repository
  
  def  call(checkout)
    # valid checkout
    # ...
    # ...
    checkout_repository.save(checkout)
  end
end
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/alissonbrunosa/ruby-ioc.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
