class PhotoUploader < CarrierWave::Uploader::Base


  include Cloudinary::CarrierWave


  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :avatar do
    resize_to_fit 350, 350
  end

  version :card do
    resize_to_fit 450, 450
  end

  version :carousel do
    resize_to_fit 1000, 1000
  end


  def content_type_whitelist
    /image\//
  end

  def size_range
    0..4.megabytes
  end

end
