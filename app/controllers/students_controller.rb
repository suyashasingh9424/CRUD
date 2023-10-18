class StudentsController < ApplicationController
   
        def new
            @student=Student.new
        end 
           def index
            @students = Student.all
          end    

            def show
            @student = Student.find(params[:id])
          end    

          def create
            @student = Student.new(student_params)
            
            if @student.save
              SendEmailJob.new(@student).enqueue(wait: 20.seconds)

               redirect_to students_path
              # redirect_to root_path
            else
              flash.now[:error] = "Your Student  form had some errors. Please check the form and resubmit."
              render :new
            end

         end   

         def edit
            @student = Student.find(params[:id])
        end      
            def update
              
            @student = Student.find(params[:id])      
              if @student.update(student_params)
              redirect_to students_path
            else
              render :edit
            end
             end

             def destroy
              @student = Student.find(params[:id])
              @student.destroy
              redirect_to students_path, notice: 'Student was successfully deleted.'
            end
       private
          #  def student_params
          #   params.require(:student).permit(:name,:email,:password)
          #  end

           def student_params
            params.require(:student).permit(:name, :email, :password, :image)
          end
          
          
          
          
          
    


end
