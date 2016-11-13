# class ReviewsController
class ReviewsController < ApplicationController
  # before_filter :authorize, :only => [:create]
  before_filter :authorize, only: :create

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: 'Review created!'
    else
      render @product
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:review_id]
    @review.destroy
    redirect_to @product, notice: 'Review destroyed!'
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
