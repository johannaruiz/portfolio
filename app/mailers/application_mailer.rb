# frozen_string_literal: true

# Defines the default mailer functionailty
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
