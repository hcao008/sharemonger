class SubscribeUserToMailingListJob < ApplicationJob
  queue_as :default
  require 'gibbon'

  def perform(user)
    gibbon = Gibbon::Request.new(api_key:"560d7cd185c5bd0a505c474a896b0377-us12")
    gibbon.timeout = 15
    gibbon.lists("bb17209c0b").members.create(
      body:{
        email_address: user.email,
        status: "subscribed",
        merge_fields: {
            FNAME: 'mimni',
            LNAME: 'McVankab'
          }
        })
  end
end
