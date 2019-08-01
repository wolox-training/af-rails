class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Rent.where(user_id: user)
    end
  end
end
