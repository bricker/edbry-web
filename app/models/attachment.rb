class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  
  # Paperclip
  has_attached_file :asset,
                    :styles => { :medium => "140x140#", :small => "125x125#", :tiny => "60x60#" },
                    :default_url => "http://thebirn.com/images/defaults/dj_pic_default_:style.jpg",
                    :url => "http://thebirn.com/avatars/user/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/avatars/user/:id/:style/:basename.:extension"
end
