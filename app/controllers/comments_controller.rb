class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      tweet = Tweet.find(params[:tweet_id])
      comment = tweet.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
      comment.sum =  comment.hun * 60 + comment.byo
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    def show
      #ここから追記
      #ここまで
    
    end

    private
  
      def comment_params
        params.require(:comment).permit(:content, :hun, :byo, tag_ids: [])
      end
      def time_params
        hun * 60+byo
      end

  end