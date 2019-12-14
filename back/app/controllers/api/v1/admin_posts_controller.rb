module Api
  module V1
    class AdminPostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = Post.where(user_id: current_user.id)
        render json: @posts
      end

      def show
        @user = User.find(@post.user_id)
        render json: {post: @post, user: @user }
      end

      def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id #TODO: modelで処理する方がベター

        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
      end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:admin_post).permit(:title, :body)
      end

    end
  end
end