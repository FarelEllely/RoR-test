class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, styles: { medium: "350x350>", thumb: "100x100>", tiny: "x80" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  acts_as_messageable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :like, through: :article

  def admin?
    role == "admin"
  end

  def name
    username
  end

  def mailboxer_email(object)
    email
  end
end
