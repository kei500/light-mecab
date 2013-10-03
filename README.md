# Mecablight

Mecablightは，mecab-rubyをラッピングすることで，より簡単に形態素解析を行うgemである．

## Environment

MeCabおよびmecab-rubyが動作する環境が必要．

## Installation

Gemfileに以下を記述する．

    gem 'mecab-light'

その後，

    $ bundle

を実行．  

以下のコマンドでもインストール可能．

    $ gem install mecab-light

## Usage
例えば「太郎はこの本を二郎を見た女性に渡した。」という文に含まれる名詞は，

```ruby
require 'mecab-light'
sentence = '太郎はこの本を二郎を見た女性に渡した。'
MecabLight::Morpheme.new(sentence).noun
```
によって取得できる（返り値はString型の配列）．

その他の品詞（形態素）を取得するメソッド名は，以下を参照．

    lib/lib/locale/morpheme.yml



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
