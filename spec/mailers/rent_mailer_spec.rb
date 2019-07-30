=begin
require "rails_helper"

RSpec.describe RentMailer, type: :mailer do
  describe "creation_rent" do
    let(:mail) { RentMailer.new_recor_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("New recor notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
=end
