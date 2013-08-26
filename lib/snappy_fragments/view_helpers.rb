require "snappy"

module SnappyFragments 
  module ViewHelpers
    def snappy_fragment(key, options = {}, &block)
      raise "No block given" unless block_given?
      compressed_fragment = Rails.cache.read(key, options)

      if compressed_fragment.present?
        decompressed_fragment = Snappy.inflate(compressed_fragment).force_encoding("utf-8")
        return decompressed_fragment.html_safe
      else
        decompressed_fragment = capture(&block)
        p decompressed_fragment
        Rails.cache.write(key, Snappy.deflate(decompressed_fragment), options)
        return decompressed_fragment
      end
    end

    alias :snappy_cache :snappy_fragment
  end
end