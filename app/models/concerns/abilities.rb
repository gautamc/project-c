module Concerns::Abilities

  ROLES = ['Admin', 'User', 'Guest']

  def can?(action, object)

    if self.isAdmin?
      true
    end

    if self.isApprovedUser?
      if object.respond_to?(user_id)
        object.user_id == self.id
      end
    end

  end

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
