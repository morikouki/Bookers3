class RelationshipsController < ApplicationController


	def create
		current_user.follow(params[:user_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
	end

	def follower
	end

	def followed
	end
end
