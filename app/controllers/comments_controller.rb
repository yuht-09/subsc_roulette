class CommentsController < ApplicationController
    def create
      comment = current_user.comments.build(comment_params)
      if comment.save
        redirect_back(fallback_location: root_path) 
      else
        redirect_back(fallback_location: root_path) 
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body).merge(movie_id: params[:movie_id])
    end
end
