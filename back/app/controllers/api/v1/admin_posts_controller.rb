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
        @post = Post.new(
          title: params[:title],
          body: params[:body],
          user_id: current_user.id
        )

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
        params.require(:post).permit(:title, :body)
      end

    end
  end
end