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

  def test_method_missing_noun
    assert_equal(['太郎', '本', '二', '郎', '女性'], @morpheme.noun)
  end

  def test_method_missing_verb
    assert_equal(['見', '渡し'], @morpheme.verb)
  end

  def test_method_missing_aux_verb
    assert_equal(['た', 'た'], @morpheme.aux_verb)
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

  def test_method_missing_interjection
    assert_equal([], @morpheme.interjection)
  end

  def test_method_missing_particle
    assert_equal(['は', 'を', 'を', 'に'], @morpheme.particle)
  end

  def test_method_missing_ad_adjective
    assert_equal(['この'], @morpheme.ad_adjective)
  end

  def test_method_missing_symbol
    assert_equal(['。'], @morpheme.symbol)
  end

  def test_method_missing_hoge
    assert_raise{@morpheme.hoge}
  end
end
