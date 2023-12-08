class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show; end

  def new; end

  def edit; end

  def update; end

  def delete; end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    flash[:success] = 'successfully deleted the Category'
    redirect_to groups_url
  end
end
