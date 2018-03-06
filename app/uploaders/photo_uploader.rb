class PhotoUploader < CarrierWave::Uploader::Base


  include Cloudinary::CarrierWave

  # Remove everything else
  version :preview do
    resize_to_fit 250, 250
  end

  def content_type_whitelist
    /image\//
  end

  def size_range
    0..2.megabytes
  end

end
