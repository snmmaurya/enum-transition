require 'rails_helper'

RSpec.describe EnumTransition, type: :model do
  describe "status transition from initial" do
    before do
      @enum_transition = FactoryBot.create(:enum_transition)
    end

    it "should not be completed" do
      @enum_transition.update(status: :completed)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from initial to completed")
      expect(@enum_transition.reload.status).to eq("initial")
    end

    it "should be verified" do
      @enum_transition.update(status: :verified)
      expect(@enum_transition.reload.status).to eq("verified")
    end

    it "should be rejected" do
      @enum_transition.update(status: :rejected)
      expect(@enum_transition.reload.status).to eq("rejected")
    end
  end

  describe "status transition from verified" do
    before do
      @enum_transition = FactoryBot.create(:enum_transition)
      @enum_transition.update(status: :verified)
    end

    it "should not be initial" do
      @enum_transition.update(status: :initial)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from verified to initial")
      expect(@enum_transition.reload.status).to eq("verified")
    end

    it "should be rejected" do
      @enum_transition.update(status: :rejected)
      expect(@enum_transition.reload.status).to eq("rejected")
    end

    it "should be completed" do
      @enum_transition.update(status: :completed)
      expect(@enum_transition.reload.status).to eq("completed")
    end
  end

  describe "status transition from completed" do
    before do
      @enum_transition = FactoryBot.create(:enum_transition)
      @enum_transition.update(status: :verified)
      @enum_transition.update(status: :completed)
    end

    it "should not be initial" do
      @enum_transition.update(status: :initial)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from completed to initial")
      expect(@enum_transition.reload.status).to eq("completed")
    end

    it "should not be verified" do
      @enum_transition.update(status: :verified)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from completed to verified")
      expect(@enum_transition.reload.status).to eq("completed")
    end

    it "should not be rejected" do
      @enum_transition.update(status: :rejected)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from completed to rejected")
      expect(@enum_transition.reload.status).to eq("completed")
    end
  end

  describe "status transition from rejected" do
    before do
      @enum_transition = FactoryBot.create(:enum_transition)
      @enum_transition.update(status: :rejected)
    end

    it "should not be initial" do
      @enum_transition.update(status: :initial)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from rejected to initial")
      expect(@enum_transition.reload.status).to eq("rejected")
    end

    it "should not be verified" do
      @enum_transition.update(status: :verified)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from rejected to verified")
      expect(@enum_transition.reload.status).to eq("rejected")
    end

    it "should not be completed" do
      @enum_transition.update(status: :completed)
      expect(@enum_transition.errors.full_messages.first).to eq("Status can't be changed from rejected to completed")
      expect(@enum_transition.reload.status).to eq("rejected")
    end
  end
end