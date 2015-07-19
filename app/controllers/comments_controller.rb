class CommentsController < ApplicationController

  def create
    @poem = Poem.find(params[:poem_id])
    @comment = @poem.comments.create(params[:comment].permit(:name, :body))

    redirect_to poem_path(@poem)

  end

  def destroy
    @poem = Poem.find(params[:poem_id])
    @comment = @poem.comments.find(params[:id])
    @comment.destroy

    redirect_to poem_path(@poem)
  end


end
