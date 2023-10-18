# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview
    def welcome_email
      student = Student.new(name: "Joe Smith", email: "joe@gmail.com")
      StudentMailer.welcome_email(student)
    end
  end
  