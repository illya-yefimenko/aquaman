class DevicePolicy < ApplicationPolicy
  def edit?
    admin_or_assigned
  end
  def show?
    admin_or_assigned
  end

  def index?
    admin_or_assigned
  end
  def new?
    admin_or_assigned
  end
  def update?
    admin_or_assigned
  end
  def destroy?
    admin_or_assigned
  end
  def create_property?
    admin_or_assigned
  end

  private

  def admin_or_assigned
    user.admin? || user == record.project.user
  end

end