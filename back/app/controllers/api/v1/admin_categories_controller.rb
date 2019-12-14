module Api
  module V1
    class AdminCategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      def index
        @category = Category.all
        render json: @category
      end

      def show
      end

      def create
        @category = Category.new(category_params)

        if Category.exists?(name: @category.name)
          response_conflict(:category)
        else
          if @category.save
            render json: @category, status: :created
          else
            response_internal_server_error
          end
        end
      end

      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @category.destroy
      end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:admin_category).permit(:name)
      end

    end
  end
end