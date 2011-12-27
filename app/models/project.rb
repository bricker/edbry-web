class Project < ActiveRecord::Base
  has_many :attachments, as: :attachable
end
