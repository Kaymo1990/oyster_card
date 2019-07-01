require 'oystercard'

describe Oystercard do
  it "should have a balance of 0" do
    expect(subject.balance).to eq 0
  end
end

describe Oystercard do
  it "should check if the user is currently on a journey" do
    expect(subject.in_journey).to eq false
  end
  it "should set in_journey to true once tapped in" do
    subject.touch_in
    expect(subject.in_journey).to eq true
  end
  it "should set in_journey to false when tapped out" do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq false
  end
end

describe Oystercard do
  describe '#touch_in' do
    it "should error if user tries to touch_in with a balance lower than £1" do
      subject.top_up(0.50)
      expect{ subject.touch_in }.to raise_error "Insufficient Balance"
    end
  end
end

describe Oystercard do
  describe "top_up" do
    it "should top up the balance with the amount entered" do
      oystercard1 = Oystercard.new
      oystercard1.top_up(3.00)
      expect(oystercard1.balance).to eq 3.00
    end
  end
  describe "#top_up" do
    it "should raise an exception when balance will be greater than 90 GBP" do
      max_balance = Oystercard::OYSTER_CAP
      expect{ subject.top_up(91.00)}.to raise_error "Oyster balance cannot exceed #{max_balance} GBP"
    end
  end
end

describe Oystercard do
  describe 'deduct' do
    it "should deduct an amount from the current balance" do
      subject.top_up(50.00)
      expect(subject.deduct(20.00)).to eq 30.0
    end
  end
end
