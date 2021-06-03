require './lib/boat'

describe Boat do
  before(:each) do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end
   it 'exists' do
     expect(@renter).to be_a(Renter)
   end

   it 'Has attributes' do
     expect(@renter.name).to eq('Patrick Star')
     expect(@renter.credit_card_number).to eq('4242424242424242')
   end
 end
