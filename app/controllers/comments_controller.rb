class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.author = current_user

    if comment.save
      flash[:notice] = 'Comment posted successfully'
    else
      flash[:alerts] = ['Failed to save new comment']
      comment.errors.full_messages.each { |error| flash[:alerts].push(error) }
    end

    # TODO: Use different urls for different commentable types
    redirect_to plant_species_url(comment.commentable)
  end

  private

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end
end
