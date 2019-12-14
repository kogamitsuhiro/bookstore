module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = Post.all
        render json: @posts
      end

      def show
        @user = User.find(@post.user_id)
        @categories = @post.posts_category.map do |posts_category|
          posts_category.category.name
        end

        render json: {
          post: @post,
          user: @user,
          categories: @categories
        }
      end

      private
        def set_post
          @post = Post.find(params[:id])
        end

    end
  end
end