class ImageCompressionService
  require 'image_processing/mini_magick'

  def self.compress(image)
    pipeline = ImageProcessing::MiniMagick.source(image.download)
    pipeline = pipeline.resize_to_limit(2000, 2000).quality(85) # Adjust these for desired quality

    compressed_image = pipeline.call
    compressed_image
  end
end
