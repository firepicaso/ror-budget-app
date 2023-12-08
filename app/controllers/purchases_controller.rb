class PurchasesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @purchases = @group.purchases.order(id: :desc)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new; end

  def edit; end

  def update; end

  def delete; end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy!
    flash[:success] = 'successfully deleted teh Transaction'
    redirect_to group_purchases_url(params[:group_id])
  end
end
