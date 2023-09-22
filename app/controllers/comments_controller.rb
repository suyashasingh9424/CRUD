class CommentsController < ApplicationController
    def index
        @student = Student.find(params[:student_id])
        @comments = @student.comments.all
      end
      def create
        @student = Student.find(params[:student_id])
        @comment = @student.comments.create(comment_params)
        redirect_to student_path(@student)
          @comment = @student.comments.build(comment_params)
        
          
      
      end
      def new
        @student = Student.find(params[:student_id])
        @comment = @student.comments.new
        @comment = @student.comments.build
      end
      def destroy
         @student = Student.find(params[:student_id])
         @comment = @student.comments.find(params[:id])
         @comment.destroy
         redirect_to student_path(@student)
      end
      def show
          @student = Student.find(params[:student_id])
          @comment = @student.comments.find(params[:id])
      end
      private
      # def comment_params
      #   params.require(:comment).permit(:commentor,:comment)
      #   end

      # app/controllers/comments_controller.rb
      def comment_params
        params.require(:comment).permit(:commentor, :comment, :image)
      end
end
