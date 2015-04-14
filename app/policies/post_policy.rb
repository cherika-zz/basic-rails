class PostPolicy < ApplicationPolicy

	def index?
		true
	end

	def destroy?
		user.present? && (record.user == user || user.admin? || user.moderator?)
	end

	class Scope < Scope
		attr_reader :user, :scope

		def initialize(user, scope)
			@user = user
			@scope = scope
		end

		def resolve
			if user && user.admin? 
				scope.all
			elsif user
				scope.where(user: user)
			end
		end
	end
end