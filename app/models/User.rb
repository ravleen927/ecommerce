class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :reviews
  has_many :cart_items

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :province_id, presence: true

  validates :address, presence: true

  belongs_to :province, optional: true


  after_create :save_address_and_province

  private

  attr_accessor :province_name

  def save_address_and_province
    if province_name.present?
      province = Province.find_or_create_by(name: province_name)
      update(address: address, province_id: province.id)
    end
  end
end