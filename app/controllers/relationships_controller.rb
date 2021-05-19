class RelationshipsController < ApplicationController


	def create
		@user = User.find(params[:user_id])
		current_user.follow(params[:user_id])
	end

	def destroy
		@user = User.find(params[:user_id])
		current_user.unfollow(params[:user_id])
	end

	def follower
		user = User.find(params[:user_id])
		@users = user.follower_user
	end

	def followed
		user = User.find(params[:user_id])
		@users = user.followed_user
	end
end
