# Taiwanese Id Validator for Ruby on Rails

[![Build Status](https://travis-ci.org/wayne5540/taiwanese_id_validator.svg?branch=master)](https://travis-ci.org/wayne5540/taiwanese_id_validator)

台灣身分證字號 驗證&產生 的 Gem

## Features

* Rails model 內驗證 (Rails 3+/4)
* Rails model 外驗證
* 新式統一證號驗證
* 產生符合格式的身分證字號，可選擇男女


## Installation

Add this line to your application's Gemfile:

    gem 'taiwanese_id_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taiwanese_id_validator

## Usage

### Rails Model Validation

#### 基本使用

```ruby
class User < ActiveRecord::Base
  validates :twid, taiwanese_id: true
end
```

#### Options

* `allow_nil` or `allow_blank`

```ruby
class User < ActiveRecord::Base
  validates :twid, taiwanese_id: { allow_nil: true }
end
```

* Case sensitive, default is true

```ruby
class User < ActiveRecord::Base
  validates :twid, taiwanese_id: { case_sensitive: false }
end
```


### Validation outside the model

#### 驗證身分證字號

```ruby
TwidValidator.valid?('A123456789') #=> true
```

```ruby
TwidValidator.valid?('A123456777') #=> false
```

#### 產生假身分證字號

Generator 是沒有被自動 require 的，所以要使用前要先 require:

```ruby
require 'taiwanese_id_validator/twid_generator'

TwidGenerator.generate #=> 隨機產生身分證字號
```

可以指定要產生男性或是女性的身分證字號

```ruby
TwidGenerator.generate("male") #=> 男性的身分證字號
```

```ruby
TwidGenerator.generate("female") #=> 女性的身分證字號
```

#### 驗證統一證號

```ruby
ItidValidator.valid?('A800000014') #=> true
```

```ruby
ItidValidator.valid?('A800000015') #=> false
```

## Others

[身分證公式](https://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E6%B0%91%E5%9C%8B%E5%9C%8B%E6%B0%91%E8%BA%AB%E5%88%86%E8%AD%89)
[新式統一證號](http://www.registration.fcu.edu.tw/wSite/public/Attachment/f1582594331972.pdf)


## Contributing

1. Fork it ( https://github.com/[my-github-username]/taiwanese_id_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## LICENSE

This project rocks and uses MIT-LICENSE.
