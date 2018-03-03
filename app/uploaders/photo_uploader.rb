class PhotoUploader < CarrierWave::Uploader::Base


  include Cloudinary::CarrierWave

  # Remove everything else
  version :preview do
    resize_to_fit 250, 250
  end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end
end
