class TweetsController < ApplicationController
before_action :authenticate_user!  
  def index
        @tweet = Tweet.new

        if params[:search] != nil && params[:search] != ''
          #部分検索かつ複数検索
          @tweets = Tweet.where("body LIKE ? ", "%" + params[:search] + "%").or(Tweet.where("title LIKE ? ", "%" + params[:search] + "%"))
        else
          @tweets = Tweet.all
        end
  
    end

    def new
        @tweet = Tweet.new
    end

      def create
        tweet = Tweet.new(tweet_params)

        url = params[:tweet][:youtube_url]
        url = url.last(11)
        tweet.youtube_url = url
      
        
        tweet.user_id = current_user.id

        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments.order("sum")
        @comment = Comment.new
        @comments_tag = params[:tag_id].present? ? Tag.find(params[:tag_id]).comments : @tweet.comments
      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end
      
      private
      def tweet_params
        params.require(:tweet).permit(:body,:title,:image)
      end


end
