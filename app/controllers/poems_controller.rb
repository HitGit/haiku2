class PoemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @poems = Poem.all.order('created_at DESC')
  end

  def new
    @poem = Poem.new
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def create
    @poem = Poem.new(poem_params)
    if @poem.save
      redirect_to @poem
    else
      render 'new'
    end
  end


  def edit
    @poem = Poem.find(params[:id])
  end



  def update
    @poem = Poem.find(params[:id])

    if @poem.update(params[:poem].permit(:title, :body))
      redirect_to @poem
    else
      render 'edit'
    end
  end


  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    redirect_to root_path

  end


  def upvote
    @poem = Poem.find(params[:id])
    @poem.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @poem = Poem.find(params[:id])
    @poem.downvote_by current_user
    redirect_to :back
  end


  private
    def poem_params
      params.require(:poem).permit(:title, :body)
    end
end
