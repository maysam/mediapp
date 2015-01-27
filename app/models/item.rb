class Item < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true

  def publish
    update_attributes public: true
  end

  def hide
    update_attributes public: false
  end
end
