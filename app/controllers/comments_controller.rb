class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @recipe = Recipe.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to recipe_comments_path
    else
      flash[:notice] = "Comments cannot be blank."
      render :new
    end
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
  end

  def edit
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to recipe_comments_path
  end

  private

  def comment_params
    params.permit(:content, :user_id, :recipe_id)
  end
end