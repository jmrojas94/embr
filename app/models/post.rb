class Post < ApplicationRecord 
  include SimpleHashtag::Hashtaggable
  belongs_to :user
  acts_as_likeable
  acts_as_mentioner
  has_many :replies, dependent: :destroy
  scope :trending, -> { order("delete_at DESC").limit(10) }
  scope :feed, -> { order("created_at ASC")}
  has_attached_file :image, :styles => { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :body, presence: true, length: { maximum: 140 }
end
