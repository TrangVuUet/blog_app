class CommentsController < ApplicationController

  def create
    @entry = Entry.find_by(id: params[:entry_id])
    @comment = @entry.comments.build(entry_params)
    if @comment.save
      flash[:success] = "Commented!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def new
    @entry = Entry.find_by(id: params[:entry_id])
    # @comment = @entry.comments.build(user_id: current_user.id)
    @comment = Comment.new
  end

  def show
    byebug
  end

  private

    def entry_params
      params.require(:comment).permit(:content, :user_id, :entry_id)
      #byebug
    end


end
