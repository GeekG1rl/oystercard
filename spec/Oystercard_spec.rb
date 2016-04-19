require "oystercard"

describe Oystercard do


  describe "#initalize" do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "increase balance by set amount" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  describe "#limit_reached" do
    it "raise error if #top_up(amount) puts balance over maximum limit." do

      message = "Top up amount pushes you over your maximum oyster card limit of £#{Oystercard::DEFAULT_LIMIT}. Your current balance is £#{Oystercard::BALANCE}"
      expect{ subject.top_up 91 }.to raise_error message
    end
  end

  describe "#deduct" do
    it "deducts a fare from oyster cardto pay for customers journey" do
      expect{ subject.deduct -1 }.to change { subject.balance }.by -1
    end
  end


end

