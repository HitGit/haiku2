class PoemsController < ApplicationController

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




  private
    def poem_params
      params.require(:poem).permit(:title, :body)
    end
end
