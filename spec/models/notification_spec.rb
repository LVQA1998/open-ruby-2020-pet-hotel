require "rails_helper"

RSpec.describe Notification, type: :model do
  let(:current_user) {FactoryBot.create :user}
  let(:receiver_user) {FactoryBot.create :user}

  subject {FactoryBot.build :notification, creator_id: current_user.id, receiver_id: receiver_user.id, data: "notification_success"}

  describe "Validation" do
    it {is_expected.to be_valid}
  end
end
