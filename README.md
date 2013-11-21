# LightMecab

LightMecabは，mecab-rubyをラッピングすることで，より簡単に形態素解析を行うgemである．

## Environment

MeCabおよびmecab-rubyが動作する環境が必要．  
MeCabの辞書にはIPA辞書を用いる．

## Installation

Gemfileに以下を記述する．

    gem 'light-mecab'

その後，

    $ bundle

を実行．  

以下のコマンドでもインストール可能．

    $ gem install light-mecab

## Usage
```ruby
require 'light-mecab'

sentence = '太郎はこの本を二郎を見た女性に渡した。'
m = LightMecab::Morpheme.new(sentence)

# 品詞数の取得
m.num
# => 15

# 品詞分解
m.parse
# => [{"太郎"=>"名詞"}, {"は"=>"助詞"}, …, {"。"=>"記号"}]

# わかち書き
m.parse.map{|p| p.keys}.flatten.join(' ')
# => "太郎 は この 本 を 二 郎 を 見 た 女性 に 渡し た 。"

# 名詞一覧
m.noun
# => ["太郎", "本", "二", "郎", "女性"]
# その他の品詞を取得するメソッド名は locale/morpheme.yml を参照

# MeCab::Nodeオブジェクトを取得したい場合
LightMecab::Morpheme.analyze(sentence)
# => MeCab::Nodeの配列が返ってきます
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
