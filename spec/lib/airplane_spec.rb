require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { Airplane.new("cesna", 10, 150, 1000) }

  describe "#initialization" do
    context 'when plane is made' do
      it 'its type is cesna' do
        expect(my_plane.type).to eq("cesna")
      end
      it 'its wing_loading is 10' do
        expect(my_plane.wing_loading).to eq(10)
      end
      it 'its type is 150' do
        expect(my_plane.horsepower).to eq(150)
      end
    end
  end

  describe "#start" do
    context 'when plane is started' do

      it 'for the first time' do
        expect(my_plane.start).to eq("airplane started")
      end
      it 'already' do
        my_plane.start
        expect(my_plane.start).to eq("airplane already started")
      end
      it 'with not enough fuel' do
        my_plane.fuel = 0
        expect(my_plane.start).to eq("need 10 gallons of fuel to start")
      end
    end
  end

  describe "#takeoff" do
    context 'when ready to take off' do
      it 'when the engine is not started' do
        expect(my_plane.takeoff).to eq("airplane not started, please start")
      end
      it 'when engine is started' do
        my_plane.start
        expect(my_plane.takeoff).to eq("airplane launched")
      end
      it 'with not enough fuel' do
        my_plane.fuel = 10
        my_plane.start
        expect(my_plane.takeoff).to eq("need 100 gallons of fuel to takeoff")
      end
    end
  end

  describe "#land" do
    context 'when ready to land' do
      it 'when the engine is not started' do
        expect(my_plane.land).to eq("airplane not started, please start")
      end
      it "plane has been started, but hasn't taken off" do
        my_plane.start
        expect(my_plane.land).to eq("airplane already on the ground")
      end
      it "if the plane is already in the air" do
        my_plane.start
        my_plane.takeoff
        expect(my_plane.land).to eq("airplane landed")
      end
      it 'with not enough fuel' do
        my_plane.fuel = 110
        my_plane.start
        my_plane.takeoff
        expect(my_plane.land).to eq("need 50 gallons of fuel to land")
      end
    end
  end
end
