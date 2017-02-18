class Subscriber < ApplicationRecord
  require 'mailchimp' # The gem name is mailchimp-api but you require mailchimp

  module MailChimpSubscription
    # These should prabably be environment variables or configuration variables
    MAIL_CHIMP_API_KEY = "e20ddab99446c3e46a5310c2aed58507-us12"
    MAIL_CHIMP_LIST_ID = "bb17209c0b"
    extend self

    def subscribe(user)
      mail_chimp.lists.subscribe(MAIL_CHIMP_LIST_ID,
                                 # The email field is a struct that can use an
                                 #    email address or two MailChimp specific list ids (see API docs)
                                 {email: user.email},
                                 # Set your merge vars here
                                 {'FNAME' => user.first_name, 'LNAME' => user.last_name})
      rescue Mailchimp::ListAlreadySubscribedError
        # Decide what to do if the user is already subscribed
      rescue Mailchimp::ListDoesNotExistError => e
        # This is definitely a problem I want to know about
        raise e
      rescue Mailchimp::Error => e
        # Unforeseen errors that need to be dealt with
    end

    private
    def mail_chimp
      @mail_chimp ||= Mailchimp::API.new(MAIL_CHIMP_API_KEY)
    end
  end
end
