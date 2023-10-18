class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(student)
    @student = student
    StudentMailer.welcome_email(@student).deliver_later
  end
end
