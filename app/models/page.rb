class Page < ActiveRecord::Base
  validates :text_id, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9_\-]/, message: "Only letters, numbers, underscore, and hyphen allowed." } # TODO Fix the error messages here (currently prepended with "Text")
  validates :title, presence: true

  attr_protected :text_id
  
  before_save :parameterize_text_id
  def parameterize_text_id # To remove uppercase letters, just so the URLs look pretty.
    text_id.parameterize
  end
  
  def to_param
    "#{text_id}"
  end
end
