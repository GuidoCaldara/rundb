class Photo < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :race

end
