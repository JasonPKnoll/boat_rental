require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end
  it "Exists" do
    expect(@dock).to be_a(Dock)
  end

  it "Has Attributes" do
    expect(@dock.name).to eq("The Rowing Dock")
    expect(@dock.max_rental_time).to eq(3)
  end

  it "Can rent and log rentals" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)

    expect(@dock.rental_log).to eq({
                                    @kayak_1 => @patrick,
                                    @kayak_2 => @patrick,
                                    @sup_1 => @eugene
                                    })
  end

  it 'charges by the hour' do

    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    @kayak_1.add_hour
    @kayak_1.add_hour

    expect(@dock.charge(@kayak_1)).to eq({ :amount => 40, :card_number => @patrick.credit_card_number})

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour

    expect(@dock.charge(@sup_1)).to eq({:amount => 45, :card_number => @eugene.credit_card_number})

  end
end
