class Ability
  include CanCan::Ability

  def initialize(admin)
    @admin = admin || Admin.new # for guest
    @admin.roles.each { |role| send(role) }

    if @admin.roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def admin
    can :manage, :all
  end

  def moderator
    can :read, Comment
    can :update, Comment
  end
end
