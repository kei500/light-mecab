require 'light-mecab/version'
require 'MeCab'
require 'yaml'

module LightMecab
  class Morpheme
    @@i18n = ::YAML.load_file(File.expand_path(File.join(__FILE__, '..', 'locale', 'morpheme.yml')))

    class << self
      # @param text [String]
      # @return [Array <MeCab::Node>] 
      def analyze(text)
        nodes = []
        node = ::MeCab::Tagger.new.parseToNode(text)
        while node
          nodes << node
          node = node.next
        end
        nodes.shift
        nodes.pop
        nodes
      end

      # @param key [String or Symbol]
      # @return [String]
      def i18n(key)
        key.is_a?(Symbol) ? @@i18n[key.to_s] : @@i18n[key]
      end
    end

    # @param text [String]
    def initialize(text)
      @nodes = self.class.analyze(text)
    end

    # @return [Integer]
    def count
      @nodes.size
    end

    # @param method_name [Symbol]
    def method_missing(method_name)
      if !self.class.i18n(method_name)
        raise NoMethodError
      end
      extract(self.class.i18n(method_name))
    end

    private

    # @param name [String]
    # @return [Array <String>]
    def extract(name)
      morpheme = []
      @nodes.each do |node|
        if name == node.feature.split(',').first.force_encoding('UTF-8')
          morpheme << node.surface.force_encoding('UTF-8')
        end
      end
      morpheme
    end
  end
end
