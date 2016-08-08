class User < ApplicationRecord

  ROLES = ['Admin', 'User', 'Guest']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes
  has_and_belongs_to_many :tickers

  def isAdmin?
    self.role == 'Admin'
  end

  def isApprovedUser?
    self.role == 'User'
  end

  def isGuest?
    self.role == 'Guest'
  end

end
