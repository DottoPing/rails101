class Account::GroupsController < ApplicationController
  before_action :login_required
  
  def index
    @group = current_user.participated_groups.order("posts_count ASC")
  end

  def create
    @post = @group.posts.new(post_params)
    @post.author = current_user

    if @post.save
      Group.increment_counter(:posts_count, @group.id)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    Group.decrement_counter(:posts_count, @group.id)
    redirect_to group_path(@group)
  end
end
