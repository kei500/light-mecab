require 'light-mecab/version'
require 'MeCab'
require 'yaml'

module LightMecab
  class Morpheme
    @@tagger = ::MeCab::Tagger.new
    @@i18n = ::YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'locale', 'morpheme.yml')))

    class << self
      # @param text [String]
      # @return [Array <MeCab::Node>] 
      def analyze(text)
        nodes = Array.new
        node = @@tagger.parseToNode(text)
        while node
          nodes << node
          node = node.next
        end
        nodes.shift
        nodes.pop
        nodes
      end

      # @return [Hash]
      def i18n
        @@i18n
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
      if !self.class.i18n[method_name.to_s]
        raise NoMethodError
      end
      extract(self.class.i18n[method_name.to_s])
    end

    private

    # @param name [String]
    # @return [Array <String>]
    def extract(name)
      morpheme = Array.new
      @nodes.each do |node|
        if name == node.feature.force_encoding('UTF-8').split(',').first
          morpheme << node.surface.force_encoding('UTF-8')
        end
      end
      morpheme
    end
  end
end
