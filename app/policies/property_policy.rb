class PropertyPolicy < ApplicationPolicy
  def edit?
    admin_or_assigned
  end

  def update?
    admin_or_assigned
  end

  def destroy?
    admin_or_assigned
  end

  private

  def admin_or_assigned
    user.admin? || user == record.device.project.user
  end
end
