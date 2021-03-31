class ProjectPolicy < ApplicationPolicy

  def create_device?
    user.admin? || user == record.user
  end

  private

  def admin_or_assigned
    user.admin? || user == record.project.user
  end

end