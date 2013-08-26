require "snappy"

module SnappyFragments 
  module ViewHelpers
    def snappy_fragment(key, options = {}, &block)
      raise "No block given" unless block_given?

      if controller.perform_caching      
        compressed_fragment = Rails.cache.read(key, options)

        if compressed_fragment.present?
          return Snappy.inflate(compressed_fragment).force_encoding("utf-8").html_safe
        else
          decompressed_fragment = capture(&block)
          Rails.cache.write(key, Snappy.deflate(decompressed_fragment), options)
          return decompressed_fragment
        end
      else
        return capture(&block)
      end
    end

    alias :snappy_cache :snappy_fragment
  end
end