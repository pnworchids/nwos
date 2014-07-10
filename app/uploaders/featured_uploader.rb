class FeaturedUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # storage :file
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end
end