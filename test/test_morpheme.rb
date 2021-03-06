# coding: utf-8
$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))

require 'test-unit'
require 'light-mecab'

class TC_LightMecab_Morpheme < Test::Unit::TestCase
  def setup
    @sentence = 'そして太郎はこの本を二郎を見た美しい女性に渡した。'
    @morpheme = LightMecab::Morpheme.new(@sentence)
  end

  def test_num
    assert_equal(17, @morpheme.num)
  end

  def test_parse()
    parse_result = [
      {"そして"=>"接続詞"},
      {"太郎"=>"名詞"},
      {"は"=>"助詞"},
      {"この"=>"連体詞"},
      {"本"=>"名詞"},
      {"を"=>"助詞"},
      {"二"=>"名詞"},
      {"郎"=>"名詞"},
      {"を"=>"助詞"},
      {"見"=>"動詞"},
      {"た"=>"助動詞"},
      {"美しい"=>"形容詞"},
      {"女性"=>"名詞"},
      {"に"=>"助詞"},
      {"渡し"=>"動詞"},
      {"た"=>"助動詞"},
      {"。"=>"記号"}
    ]
    assert_equal(parse_result, @morpheme.parse)
  end

  def test_method_missing_ad_adjective
    assert_equal(['この'], @morpheme.ad_adjective)
  end

  def test_method_missing_prefix
    assert_equal([], @morpheme.prefix)
  end

  def test_method_missing_noun
    assert_equal(['太郎', '本', '二', '郎', '女性'], @morpheme.noun)
  end

  def test_method_missing_verb
    assert_equal(['見', '渡し'], @morpheme.verb)
  end

  def test_method_missing_adjective
    assert_equal(['美しい'], @morpheme.adjective)
  end

  def test_method_missing_adverb
    assert_equal([], @morpheme.adverb)
  end

  def test_method_missing_conjunction
    assert_equal(['そして'], @morpheme.conjunction)
  end

  def test_method_missing_particle
    assert_equal(['は', 'を', 'を', 'に'], @morpheme.particle)
  end

  def test_method_missing_aux_verb
    assert_equal(['た', 'た'], @morpheme.aux_verb)
  end

  def test_method_missing_interjection
    assert_equal([], @morpheme.interjection)
  end

  def test_method_missing_symbol
    assert_equal(['。'], @morpheme.symbol)
  end

  def test_method_missing_filler
    assert_equal([], @morpheme.filler)
  end

  def test_method_missing_other
    assert_equal([], @morpheme.other)
  end

  def test_method_missing_unknown
    assert_equal([], @morpheme.unknown)
  end

  def test_method_missing_hoge
    assert_raise(NoMethodError) do
      @morpheme.hogei
    end
  end
end
