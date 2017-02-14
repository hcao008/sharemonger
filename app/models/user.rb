class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile




  # Need to declare explicit relationship on join table
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
  has_many :sales, class_name: "Order", foreign_key: "seller_id"

  #after user is created perform this particular action/method
  after_create :assign_role

  def assign_role
    if user_type == 'basic'
      add_role :basic
    elsif user_type == 'standard'
      add_role :standard
    elsif user_type == 'premium'
      add_role :premium
    elsif user_type == 'admin'
      add_role :admin
    end
  end


end
