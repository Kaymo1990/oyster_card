require 'oystercard'
describe Oystercard do
  it 'should have a balance of 0' do
    expect(subject.balance).to eq 0
  end
  it 'should check if the user is currently on a journey' do
    expect(subject.in_journey).to eq false
  end
  it 'should set in_journey to true once tapped in' do
    subject.top_up(50)
    subject.touch_in
    expect(subject.in_journey).to eq true
  end
  it 'should set in_journey to false when tapped out' do
    subject.top_up(50)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to eq false
  end
end

describe Oystercard do
  describe '#touch_in' do
    it 'should error if user tries to touch_in with a balance lower than £1' do
      subject.top_up(0.50)
      expect { subject.touch_in }.to raise_error 'Insufficient Balance'
    end
  end
end

describe Oystercard do
  describe '#top_up' do
    it 'should top up the balance with the amount entered' do
      oystercard1 = Oystercard.new
      oystercard1.top_up(3.00)
      expect(oystercard1.balance).to eq 3.00
    end

    it 'should raise an exception when balance will be greater than 90 GBP' do
      max_balance = Oystercard::MAXIMUM_BALANCE
      expect { subject.top_up(91.00) }.to raise_error "Oyster balance cannot exceed #{max_balance} GBP"
    end
  end
end

describe Oystercard do
  describe '#touch_out'do
  it 'should deduct a balance when touching out' do
    subject.top_up(10.00)
    expect { subject.touch_out }.to change{subject.balance}.by(-1)
  end
end
end

describe Oystercard do
  before do
    entry_station = double (:station)
    describe 'touch_in' do
      allow (entry_station).to receive(:name).and_return("Aldgate East")
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq "Aldgate East"
    end
  end
end

describe Oystercard do
  describe '#list_journeys' do
    it 'should list all the journeys on the card' do
      subject.top_up(20)
      subject.touch_in("Aldgate East")
      subject.touch_out("Vauxhall")
      p subject.list_journeys
      expect(subject.list_journeys).not_to be_empty
    end
  end
  describe '#list_journeys' do
    it 'should be empty on initialize' do
      expect(subject.list_journeys).to eq([])
    end
  end
end
