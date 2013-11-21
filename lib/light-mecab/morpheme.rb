module LightMecab
  class Morpheme
    @@tagger = ::MeCab::Tagger.new
    @@i18n = ::YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', '..', 'locale', 'morpheme.yml')))

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

      # @param node [MeCab::Node]
      # @return [String]
      def pos(node)
        node.surface.force_encoding('UTF-8')
      end

      # @param node [MeCab::Node]
      # @return [String]
      def pos_name(node)
        node.feature.force_encoding('UTF-8').split(',').first
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
    def num
      @nodes.size
    end

    # @param method_name [Symbol]
    # @raise [NoMethodError]
    def method_missing(method_name)
      raise NoMethodError unless self.class.i18n[method_name.to_s]
      extract(self.class.i18n[method_name.to_s])
    end

    private

    # @param name [String]
    # @return [Array <String>]
    def extract(name)
      @nodes.map {|node| self.class.pos(node) if name == self.class.pos_name(node)}.compact
    end
  end
end
