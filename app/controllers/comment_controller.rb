class CommentsController < ApplicationController

 def create
  @product = Product.find(params[:product_id])
  @comment = @product.comments.new(params[:comment])
  @comment.user = current_user
  @comment.save
  redirect_to product_path(@product)
  respond_to do |format|
      if @comment.save
        ProductChannel.broadcast_to @product.id, comment: @comment
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def average_rating
    ratings.sum(:score) / ratings.size
  end

  def destroy
    @comment = Comment.find(params[:id])
    @product = @comment.product
  end

  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
end